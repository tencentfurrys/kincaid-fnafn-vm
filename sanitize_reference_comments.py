#!/usr/bin/env python3
"""sanitize_reference_comments.py -- neutralize inner C block comments.

GML block comments do not nest: any /* ... */ inside a
/* BEGIN DECOMPILED REFERENCE ... END DECOMPILED REFERENCE */ block closes
the outer block early (first inner */ wins), exposing decompiled C as live
GML (12 compile errors: stray ', &, blank-line assignment errors).
Fix: inside each BEGIN..END span, rewrite /* -> / * and */ -> * /,
keeping the span's own BEGIN opener and END closer intact.
Idempotent: second run finds no inner markers and changes nothing.
"""
from pathlib import Path

BASE = Path(__file__).resolve().parent
PROJ = BASE / "FNAFN-GML-project"

BEGIN = "/* BEGIN DECOMPILED REFERENCE"
END = "END DECOMPILED REFERENCE */"

changed_files = 0
changed_spans = 0
for f in sorted(PROJ.rglob("*.gml")):
    lines = f.read_text(encoding="utf-8", errors="replace").splitlines(keepends=True)
    out = []
    in_ref = False
    dirty = False
    for line in lines:
        if BEGIN in line and not in_ref:
            in_ref = True
            out.append(line)
            continue
        if END in line and in_ref:
            in_ref = False
            out.append(line)
            continue
        if in_ref:
            fixed = line.replace("/*", "/ *").replace("*/", "* /")
            if fixed != line:
                dirty = True
                changed_spans += 1
            out.append(fixed)
        else:
            out.append(line)
    if dirty:
        f.write_text("".join(out), encoding="utf-8", newline="\n")
        changed_files += 1

print(f"sanitized spans: {changed_spans} in {changed_files} files")

# verify: no inner markers remain
bad = []
for f in sorted(PROJ.rglob("*.gml")):
    lines = f.read_text(encoding="utf-8", errors="replace").splitlines()
    in_ref = False
    for i, line in enumerate(lines, 1):
        if BEGIN in line:
            in_ref = True
            continue
        if END in line:
            in_ref = False
            continue
        if in_ref and ("/*" in line or "*/" in line):
            bad.append(f"{f.relative_to(BASE)}:{i}")
print(f"remaining inner markers: {len(bad)}")
for b in bad[:10]:
    print(" ", b)
