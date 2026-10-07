#!/usr/bin/env python3
"""VM donor APK: v2025.9 Kincaid runner + our VM-compiled FNAFN.win.

Every entry of kincaid-v2025.9-INPUTFIX.apk is copied byte-identical EXCEPT
assets/game.droid, replaced with output/FNAFN/FNAFN.win (VM build: CODE +
VARI chunks, zero GML errors, boots to main loop on Windows). META-INF
dropped; zipalign + apksign with kincaid/opencode-debug.jks afterwards.
Prints full diff report vs the donor.
"""
import zipfile
from pathlib import Path

BASE = Path(__file__).resolve().parent
SRC = BASE / "kincaid" / "binaries" / "kincaid-v2025.9-INPUTFIX.apk"
DATAWIN = BASE / "output" / "FNAFN" / "FNAFN.win"
OUT = BASE / "kincaid-v202509-FNAFN-vm-donor-unsigned.apk"


def main():
    assert SRC.exists(), SRC
    assert DATAWIN.exists(), DATAWIN
    changed, dropped = [], []
    with zipfile.ZipFile(SRC) as zin, zipfile.ZipFile(OUT, "w") as zout:
        for info in zin.infolist():
            name = info.filename
            if name.startswith("META-INF/"):
                dropped.append(name)
                continue
            payload = DATAWIN.read_bytes() if name == "assets/game.droid" \
                else zin.read(name)
            if name == "assets/game.droid":
                changed.append(name)
            ni = zipfile.ZipInfo(name, date_time=info.date_time)
            ni.compress_type = info.compress_type
            ni.external_attr = info.external_attr
            ni.create_system = info.create_system
            zout.writestr(ni, payload)

    with zipfile.ZipFile(SRC) as za, zipfile.ZipFile(OUT) as zb:
        na, nb = set(za.namelist()), set(zb.namelist())
        removed = sorted(n for n in na - nb if not n.startswith("META-INF/"))
        added = sorted(nb - na)
        diffs = [n for n in sorted(na & nb) if za.read(n) != zb.read(n)]
    print(f"wrote {OUT.name} ({OUT.stat().st_size:,} B)")
    print(f"dropped META-INF: {len(dropped)}")
    print(f"removed non-META: {removed or 'NONE'}  added: {added or 'NONE'}")
    print(f"changed: {diffs}")
    assert diffs == ["assets/game.droid"], "unexpected diff!"
    print("VERIFIED: only assets/game.droid differs (now VM FNAFN.win)")


if __name__ == "__main__":
    main()
