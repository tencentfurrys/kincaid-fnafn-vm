#!/usr/bin/env python3
"""split_combined_events.py -- one-shot split of combined multi-sub-event
object .gml files into per-sub-event <Type>_<N>.gml files for the IDE.

A combined file holds N sections, each starting at a
  // ---- sub-event <Type>_<N> ...
line and containing exactly one /* BEGIN/END DECOMPILED REFERENCE */ pair.
Each section becomes objects/<Obj>/<Type>_<N>.gml; the combined file is
deleted. Idempotent: skips files already split (no combined stem left).
"""
import re
from pathlib import Path

BASE = Path(__file__).resolve().parent
OBJ = BASE / "FNAFN-GML-project" / "objects"
MARK = re.compile(r"^// ---- sub-event (\w+?)_(\d+).*$", re.M)

done = []
for objdir in sorted(OBJ.iterdir()):
    if not objdir.is_dir():
        continue
    for f in sorted(objdir.glob("*.gml")):
        if "_" in f.stem and f.stem.rsplit("_", 1)[1].isdigit():
            continue  # already a split file
        text = f.read_text(encoding="utf-8", errors="replace")
        marks = list(MARK.finditer(text))
        if len(marks) < 2:
            continue  # single-event or no markers
        # cut points: each mark starts a section; preamble before first
        # mark is file-level header (description + notes) -- dropped, each
        # split file gets its own description line.
        parts = MARK.split(text)
        # split() with 2 groups -> [pre, T1, N1, body1, T2, N2, body2, ...]
        assert len(parts) >= 7 and len(parts) % 3 == 1, f.name
        n = (len(parts) - 1) // 3
        obj = objdir.name
        for i in range(n):
            typ, num, body = parts[1 + 3 * i], parts[2 + 3 * i], parts[3 + 3 * i]
            assert body.count("/* BEGIN") == 1 and body.count(
                "END DECOMPILED REFERENCE") == 1, f"{f.name} {typ}_{num}"
            out = objdir / f"{typ}_{num}.gml"
            out.write_text(
                f"/// @description FNAFN {obj} / {typ}_{num} - PORTED from C\n"
                f"// ---- sub-event {typ}_{num} (split from {f.name}) ----\n"
                + body.lstrip("\n"), encoding="utf-8", newline="\n")
        f.unlink()
        done.append((str(f.relative_to(BASE)), n))

for rel, n in done:
    print(f"split {rel} -> {n} files")
print(f"{len(done)} combined files split")
