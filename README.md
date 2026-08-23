# C-Beam Gantry — Dual Makita RT0702/700C Router Mount

![Gantry](docs/gantry_preview.png)

A rigid C-beam gantry designed for CNC routing with dual Makita RT0702/700C trim routers. Features 4× MGN9H linear rail carriages for maximum stiffness and a TR8×8 Acme lead screw drive.

---

## ✨ Key Features

- **4× MGN9H carriages** — 2 rails × 2 carriages each, eliminates racking and tipping
- **TR8×8 Acme lead screw** — 8mm/rev lead, fast and precise Z movement
- **Dual Makita RT0702/700C mounts** — 65mm clamp adapters, hot-swappable
- **120×160×8mm 6061-T6 aluminium plate** — rigid under heavy cutting loads
- **DXF ready** — laser cutter / waterjet compatible with 5-layer hole coding

---

## 📁 Repository Structure

```
cbeam-gantry-makita-router/
├── cad/
│   └── gantry_plate.dxf        # Laser/waterjet ready DXF (5 layers)
├── docs/
│   └── assembly_guide.md       # Step-by-step assembly instructions
├── bom/
│   └── bom.csv                 # Full Bill of Materials
└── README.md
```

---

## 📐 Gantry Plate Specifications

| Property | Value |
|---|---|
| Plate Size | 120mm × 160mm |
| Plate Thickness | 8mm |
| Material | 6061-T6 Aluminium |
| Linear Rail | MGN9H (9mm rail, H-block) |
| Carriages | 4× MGN9H (2 per rail) |
| Rail Spacing | 80mm centre-to-centre |
| Carriage Spacing | 80mm vertical centre-to-centre |
| Lead Screw | TR8×8 Acme (8mm dia, 4-start, 8mm/rev) |
| Router Mount | 2× Makita RT0702/700C 65mm clamp adapter |

---

## 🕳️ Hole Summary

| Layer | Dia | Qty | Purpose |
|---|---|---|---|
| `M3_HOLES` | Ø3.2mm | 16 | MGN9H carriage mounting |
| `M4_HOLES` | Ø4.3mm | 4 | TR8×8 lead screw nut |
| `M5_HOLES` | Ø5.3mm | 8 | Makita router adapter mounts |
| `LEADSCREW` | Ø9.0mm | 1 | Lead screw shaft clearance |
| `OUTLINE` | — | 1 | Plate cut boundary |

---

## 🛒 Bill of Materials

See [`bom/bom.csv`](bom/bom.csv) for the full BOM with quantities, sources, and notes.

---

## 🔧 Assembly

See [`docs/assembly_guide.md`](docs/assembly_guide.md) for the full step-by-step assembly guide.

---

## 🖨️ DXF Layers Guide

When sending `cad/gantry_plate.dxf` to a laser cutter or waterjet:

| Layer | Recommended Operation |
|---|---|
| `OUTLINE` | Profile cut (last operation) |
| `M3_HOLES` | Drill / pierce Ø3.2mm |
| `M4_HOLES` | Drill / pierce Ø4.3mm |
| `M5_HOLES` | Drill / pierce Ø5.3mm |
| `LEADSCREW` | Drill / pierce Ø9.0mm |

> **Tip:** For tapped holes, drill undersize and tap after cutting:
> M3 → Ø2.5mm drill, M4 → Ø3.3mm drill, M5 → Ø4.2mm drill

---

## 📎 References

- [Makita RT0702/700C Router Adapter — 3DPrintronics](https://www.3dprintronics.com/products/mounting-kit-for-makita-trim-router-rt0702-700c)
- [OpenBuilds C-Beam Extrusion](https://openbuildspartstore.com/c-beam-linear-rail/)
- [MGN9H Rail Datasheet — Hiwin](https://www.hiwin.com/pdf/linear_guideways/MG.pdf)
- [TR8×8 Lead Screw — RobotDigg](https://www.robotdigg.com)

---

## 📄 License

This design is released under the [CERN Open Hardware Licence v2 - Permissive](https://ohwr.org/cern_ohl_p_v2.txt).
