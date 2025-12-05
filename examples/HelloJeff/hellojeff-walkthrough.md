# HelloJeff Walkthrough – JEFF Genesis Module  
**Preview Draft • December 2025 • Intentionally Imperfect**

## Purpose  
This walkthrough explains how the **HelloJeff Genesis Module** works across all four example files.  
It is the canonical “Hello World” of the JEFF Standard.  
The goal: prove that a JEFF runtime can load a module, enforce lifecycle phases, and produce the canonical output.

---

## Step 1 – Read the README  
File: `README.md`  

- Describes the intent:  
  - On `Init → Bind → Activate`, print one line to console.  
  - All subsequent `Tick` calls are no‑op.  
  - Module stays alive forever in pure, idle state.  
- This sets the challenge: boot HelloJeff and win **Runtime Zero**.

---

## Step 2 – Inspect the WASM Code  
File: `hellojeff.wat`  

Key points:  
- Imports `JEFF.Platform.Console.write_line` boundary adapter.  
- Stores the string `"Hello World! Our name is JEFF."` in memory.  
- Tracks state with a global `printed` flag.  
- Lifecycle functions (`init`, `bind`, `activate`, `tick`, `deactivate`, `destroy`) are all exported.  
- On first `activate`, calls `write_line` and sets `printed = 1`.  
- Subsequent ticks are no‑op.

---

## Step 3 – Check the Describe() Manifest  
File: `hellojeff-manifest.json`  

Highlights:  
- Declares namespace: `JEFF.Examples.Core.HelloJeff`.  
- JEFFID: `c0a1e5d0-0d1e-5d0c-9e5d-0a1e5d0d1e5d`.  
- Module kind: `pure`.  
- Lifecycle budgets: small CPU/memory ceilings.  
- State: one mutable boolean `printed`.  
- External boundary: `JEFF.Platform.Console.WriteLine`.  
- Governance: semver versioning, telemetry counters, replay enabled.  
- Certification: provisional CA signature included.

---

## Step 4 – Verify the Certification Record  
File: `hellojeff-cert.json`  

Contents:  
- `caId`: `provisional-grok4-genesis-2025`.  
- `jeffId`: matches manifest.  
- `manifestHash`: placeholder until runtime calculates canonical hash.  
- `signature`: provisional self‑signed.  
- `issuedAt`: timestamp.  
- `note`: valid only until official JCA exists.

---

## Step 5 – Follow the Runtime Zero Loop  
File: `runtime-zero.md`  

Skeleton pseudocode:  

```pseudo
function main():
    manifest = parse_json("hellojeff-manifest.json")
    cert = parse_json("hellojeff-cert.json")
    if cert.jeffId != manifest.jeffId:
        fail("Certification mismatch")

    wasm = load_wasm("hellojeff.wasm")
    wasm.bind("JEFF.Platform.Console.write_line", host_console_write)

    wasm.call("init")
    wasm.call("bind")
    wasm.call("activate")

    while true:
        wasm.call("tick")
        sleep(1000ms)
