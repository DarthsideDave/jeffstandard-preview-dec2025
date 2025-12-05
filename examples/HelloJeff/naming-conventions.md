# JEFF Naming Conventions Guide  
**Preview Draft • December 2025 • Intentionally Imperfect**

## Purpose  
This document defines the recommended file and folder naming conventions for JEFF modules and examples.  
It exists to keep the repo consistent, predictable, and aligned with the JEFF Standard.  
(And yes, we admit: even the author has already broken these rules. Hypocrisy noted, but progress > perfection.)

## Folder Naming  
- Each module lives in a folder named after its **namespace**.  
- Example:  
  /examples/JEFF.Examples.Core.HelloJeff/

## File Naming  
Inside each module folder, use canonical names:  
- README.md → Human‑readable description of the module.  
- Module.wat → WebAssembly text or binary file implementing lifecycle functions.  
- Describe.json → Manifest file conforming to Describe schema.  
- Cert.json → Certification record binding JEFFID + manifest.  
- RuntimeZero.md → Skeleton runtime loop or challenge doc.  
- Walkthrough.md → Optional step‑by‑step guide for newcomers.

## JEFFID  
- Every module must declare a **JEFFID** (UUID).  
- JEFFID must match across manifest and certification record.  
- Example:  
  "jeffId": "c0a1e5d0-0d1e-5d0c-9e5d-0a1e5d0d1e5d"

## External Boundaries  
- External adapters must be declared under JEFF.Platform.*.  
- Example:  
  "namespace": "JEFF.Platform.Console"  
  "contractId": "WriteLine"

## Governance Note  
These conventions are aspirational.  
Breaking them is allowed in preview repos.  
But contributors should strive to follow them so JEFF modules look and feel consistent.  

## Closing Nod  
The author admits: the first HelloJeff examples didn’t follow these conventions perfectly.  
That’s fine. Hypocrisy is part of genesis.  
The important thing is to **ship it**, then tighten the rules as JEFF evolves.  
