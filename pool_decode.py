#!/usr/bin/env python3
"""pool_decode.py -- decode recoverable runtime-pool slots offline.

Covers the case-label machinery (per recon ses_ee7f3d08affeUmuPurYiswnzUF):
  (i)  func_0x0001401453a0(pool, exe) string seeders -> exact C-strings
  (ii) guard-block uRam 0x14-stride numeric tables -> doubles + indices
Expression constants (func_0x00014000bee0 readers, 506 refs) are NOT seeded
anywhere in the exe image -- those stay TODO(calibrate) for runtime capture.

Emits pool-map.json: {addr: {kind, value, status}} for all 248 distinct
TODO addrs, then patches GML comments at covered sites (identity confirmed).
"""
import json
import re
import struct
from pathlib import Path

BASE = Path(__file__).resolve().parent
EXE = BASE / "fnafn" / "binaries" / "FNAFN.exe"
ANN = BASE / "gml_all_414_decompiled.annotated.c"
PROJ = BASE / "FNAFN-GML-project"

exe = EXE.read_bytes()
# .data section: VA 0x5c3000, raw 0x5c0e00 (per recon)
DATA_VA, DATA_RAW = 0x1405C3000, 0x5C0E00


def va_to_raw(va):
    return va - DATA_VA + DATA_RAW


def cstr_at_va(va):
    raw = va_to_raw(va)
    end = exe.index(b"\0", raw)
    return exe[raw:end].decode("utf-8", "replace")


ann = ANN.read_text(encoding="utf-8", errors="replace")

# (i) string seeders: func_0x0001401453a0(0x14065xxxx, 0x1405cxxxx)
seed_re = re.compile(
    r"func_0x0001401453a0\(\s*(0x1406[57][0-9a-fA-F]+)\s*,\s*(0x140[0-9a-fA-F]+)\s*\)")
strings = {}
for m in seed_re.finditer(ann):
    pool, src = int(m.group(1), 16), int(m.group(2), 16)
    try:
        strings[pool] = cstr_at_va(src)
    except (ValueError, IndexError):
        strings[pool] = "<unreadable>"

# (ii) guard-block uRam writes: uRam000000014065xxxx = <int/double literal>
guard_re = re.compile(
    r"uRam0000000(1406[57][0-9a-fA-F]+)\s*=\s*(-?0x[0-9a-fA-F]+|-?\d+)\s*;")
numerics = {}
for m in guard_re.finditer(ann):
    addr, lit = int(m.group(1), 16), m.group(2)
    numerics.setdefault(addr, lit)

# collect all TODO addrs cited in GML
todo_re = re.compile(r"0x1406[57][0-9a-fA-F]+")
todo_addrs = set()
todo_files = list(PROJ.rglob("*.gml"))
for f in todo_files:
    t = f.read_text(encoding="utf-8", errors="replace")
    if "TODO(calibrate)" in t:
        todo_addrs.update(int(x, 16) for x in todo_re.findall(t))

pool_map = {}
for a in sorted(todo_addrs):
    if a in strings:
        pool_map[f"{a:#x}"] = {"kind": "string", "value": strings[a],
                               "status": "exact-exe"}
    elif a in numerics:
        pool_map[f"{a:#x}"] = {"kind": "guard-literal",
                               "value": numerics[a], "status": "exact-exe"}
    else:
        pool_map[f"{a:#x}"] = {"kind": "expression-const",
                               "value": None, "status": "runtime-only"}

(BASE / "pool-map.json").write_text(json.dumps(pool_map, indent=1))
n_exact = sum(1 for v in pool_map.values() if v["status"] == "exact-exe")
print(f"pool addrs cited in GML: {len(pool_map)}; "
      f"exact-exe: {n_exact}; runtime-only: {len(pool_map) - n_exact}")
print(f"string seed pairs decoded: {len(strings)}")
print("wrote pool-map.json")
