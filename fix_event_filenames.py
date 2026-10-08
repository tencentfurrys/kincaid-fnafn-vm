import re
from pathlib import Path
BASE = Path(r"C:\Users\RDP\Documents\Default Project\kincaid-fnafn-savepoint")
OBJ = BASE / "FNAFN-GML-project" / "objects"
# Single-subtype events: the file carries no subtype number.
SUFFIXLESS = {"PreCreate", "Create", "Destroy", "Step", "Draw", "CleanUp",
              "BeginStep", "EndStep"}
MARK = re.compile(r"^// ---- sub-event (\w+?)_(\d+).*$", re.M)
BEGINMARK = re.compile(r"gml_Object_\w+_([A-Za-z]+)_(\d+)\b")
renamed = 0
for objdir in sorted(OBJ.iterdir()):
    if not objdir.is_dir():
        continue
    for f in sorted(objdir.glob("*.gml")):
        if len(f.stem.rsplit("_", 1)) > 1 and f.stem.rsplit("_", 1)[1].isdigit():
            continue  # already suffixed
        text = f.read_text(encoding="utf-8", errors="replace")
        if f.stem in SUFFIXLESS:
            target = objdir / f"{f.stem}_0.gml"
        else:
            marks = MARK.findall(text)
            if len(marks) != 1:
                bmarks = sorted(set(BEGINMARK.findall(text)))
                # filter to the file's own object+base (exclude heredoc noise)
                own = [(t, n) for t, n in bmarks
                       if text.count(f"gml_Object_{objdir.name}_{t}_{n}") >= 1]
                if len(own) != 1:
                    print(f"SKIP {objdir.name}/{f.name}: {len(marks)} markers, "
                          f"{len(own)} own refs")
                    continue
                marks = own
            typ, num = marks[0]
            target = objdir / f"{typ}_{num}.gml"
        if target.exists():
            if target.read_bytes() == f.read_bytes():
                f.unlink()
                print(f"deleted identical dup {objdir.name}/{f.name}")
            else:
                print(f"CONFLICT {objdir.name}/{f.name} vs {target.name} (kept both)")
            renamed += 1
        else:
            f.rename(target)
            print(f"renamed {objdir.name}/{f.name} -> {target.name}")
            renamed += 1
print(f"handled {renamed} files")
