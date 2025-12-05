# Runtime Zero – JEFF Genesis Runtime  
**Preview Draft • December 2025 • Intentionally Imperfect**

## Purpose  
Runtime Zero is the first skeleton runtime capable of loading and executing the **HelloJeff Genesis Module**.  
Its job is to prove the JEFF Standard can move from specification to execution.  
The first engine that boots HelloJeff and prints the canonical line wins permanent glory as **Runtime Zero**.

---

## Design Principles  
- **Minimalism:** Only enforce what is necessary to run HelloJeff.  
- **Transparency:** Show the lifecycle phases explicitly.  
- **Extensibility:** Leave hooks for certification, budgets, and replay.  
- **Determinism:** No hidden side effects; console output only via boundary adapter.

---

## Pseudocode Loop  

```pseudo
function main():
    # 1. Load manifest JSON
    manifest = parse_json("hellojeff-manifest.json")

    # 2. Verify certification record
    cert = parse_json("hellojeff-cert.json")
    if cert.jeffId != manifest.jeffId:
        fail("Certification mismatch")
    # Signature verification is stubbed for now

    # 3. Load WASM module
    wasm = load_wasm("hellojeff.wasm")

    # 4. Bind external boundary adapter
    # JEFF.Platform.Console.write_line → host console print
    wasm.bind("JEFF.Platform.Console.write_line", host_console_write)

    # 5. Execute lifecycle phases
    wasm.call("init")
    wasm.call("bind")
    wasm.call("activate")

    # 6. Runtime loop
    while true:
        wasm.call("tick")
        sleep(1000ms)  # scheduler tick
