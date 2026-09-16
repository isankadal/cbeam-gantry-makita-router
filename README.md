# C-Beam Gantry — Dual Makita RT0702/700C Router Mount

<!-- Auto-rendered by GitHub Actions on every push to main -->
![Gantry Assembly Preview](renders/gantry_assembly.png)

> 🤖 _Preview image is auto-rendered from [`cad/gantry_assembly.scad`](cad/gantry_assembly.scad) by the [Render OpenSCAD workflow](.github/workflows/render-openscad.yml) on every push to `main`._

A rigid C-beam gantry designed for CNC routing with dual Makita RT0702/700C trim routers. Features 4× MGN9H linear rail carriages on the C-beam side faces for maximum stiffness, riding on the [Bulkman3D PL0015](https://bulkman3d.com/product/pl0015/) gantry plate via 6× V-Wheels, driven by a TR8×8 Acme lead screw.

---

## ✨ Key Features

- **Bulkman3D PL0015 base plate** — 125×125×6mm 6061-T6 aluminium, black anodised
- **4× MGN9H carriages** — 2 rails × 2 carriages each on C-beam **side faces** — eliminates racking and tipping
- **6× V-Wheels** — 3 fixed + 3 eccentric, ride on C-beam front 80mm face
- **TR8×8 Acme lead screw** — 8mm/rev lead, fast and precise Z movement
- **Dual Makita RT0702/700C mounts** — 65mm clamp adapters, hot-swappable
- **DXF + OpenSCAD ready** — laser/waterjet DXF with 8 named layers + full 3D parametric model
- **Auto-rendered preview** — GitHub Actions renders a PNG on every push

---

## 📁 Repository Structure

```
cbeam-gantry-makita-router/
├── .github/
│   └── workflows/
│       └── render-openscad.yml   # Auto-renders OpenSCAD → PNG on push
├── cad/
│   ├── gantry_plate.dxf          # Rev C laser/waterjet DXF (8 layers)
│   ├── gantry_assembly.scad      # Full 3D parametric assembly model
│   └── README_cad.md             # CAD file usage guide
├── docs/
│   └── assembly_guide.md         # Step-by-step assembly instructions
├── bom/
│   └── bom.csv                   # Full Bill of Materials (25 items)
├── renders/
│   └── gantry_assembly.png       # Auto-generated preview (do not edit)
└── README.md
```

---

## 📐 Gantry Plate Specifications — Rev C (PL0015)

| Property | Value |
|---|---|
| Base Plate | [Bulkman3D PL0015](https://bulkman3d.com/product/pl0015/) C-Beam Gantry Plate XL |
| Plate Size | 125mm × 125mm |
| Plate Thickness | 6mm |
| Material | 6061-T6 Aluminium, black anodised |
| C-Beam | 40×80mm extrusion |
| V-Wheels | 6× Solid V-Wheel (3 fixed + 3 eccentric) on C-beam front face |
| Linear Rail | 2× MGN9H (9mm rail, H-block) on C-beam **side faces** |
| Carriages | 4× MGN9H H-block (2 per rail), bolted to plate back face |
| Rail Spacing (H) | 75mm centre-to-centre |
| Carriage Spacing (V) | 65mm centre-to-centre |
| Lead Screw | TR8×8 Acme (8mm dia, 4-start, 8mm/rev) |
| Nut Block Centre | (62.5, 62.5) — plate centre |
| Router Mount | 2× Makita RT0702/700C 65mm clamp adapter |

---

## 🕳️ Hole Summary (Rev C DXF)

| Layer | Dia | Qty | Purpose |
|---|---|---|---|
| `OUTLINE` | — | 1 | Plate cut boundary 125×125mm |
| `VWHEEL_FIXED` | Ø5.0mm | 3 | Fixed V-wheel M5 holes |
| `VWHEEL_ECCENTRIC` | Ø7.8mm | 3 | Eccentric spacer V-wheel holes |
| `M3_HOLES` | Ø3.2mm | 16 | MGN9H carriage bolts (back face) |
| `M4_HOLES` | Ø4.3mm | 4 | TR8×8 nut block bolts |
| `M5_HOLES` | Ø5.3mm | 8 | Makita router adapter bolts |
| `LEADSCREW` | Ø9.0mm | 1 | Lead screw shaft clearance |
| `MGRID` | Ø5.0mm | 14 | M5 utility grid (20mm pitch) |

---

## 🖥️ 3D Model — OpenSCAD

Open [`cad/gantry_assembly.scad`](cad/gantry_assembly.scad) in [OpenSCAD](https://openscad.org) to explore the full parametric assembly.

All 12 components are individually togglable via `SHOW_*` variables at the top of the file:

| Toggle | Component |
|---|---|
| `SHOW_CBEAM` | C-Beam 40×80mm extrusion |
| `SHOW_GANTRY_PLATE` | PL0015 125×125×6mm plate |
| `SHOW_VWHEELS` | 6× V-Wheels |
| `SHOW_MGN9H_RAILS` | 2× MGN9H side rails |
| `SHOW_MGN9H_CARRIAGES` | 4× H-block carriages |
| `SHOW_LEADSCREW` | TR8×8 lead screw |
| `SHOW_NUT_BLOCK` | Brass nut block |
| `SHOW_BEARING_BLOCKS` | FK8 + FF8 bearing blocks |
| `SHOW_MOTOR` | NEMA17 stepper + coupler |
| `SHOW_ROUTER_MOUNTS` | 2× 65mm clamp adapters |
| `SHOW_ROUTERS` | Makita RT0702/700C body |

Change `CBEAM_L = 300` to your actual Z-travel — the full assembly scales automatically.

---

## 🤖 Auto-Render Workflow

The [`render-openscad.yml`](.github/workflows/render-openscad.yml) workflow runs on every push to `main` that modifies a `.scad` file:

1. Installs OpenSCAD + virtual display (`xvfb`) on Ubuntu runner
2. Renders all `cad/*.scad` → `renders/*.png` at **1920×1080**
3. Commits updated PNGs back to `renders/` with `[skip ci]`
4. Uploads PNGs as downloadable workflow artifacts (30-day retention)

Trigger a manual render any time from **[Actions → Render OpenSCAD Preview → Run workflow](../../actions/workflows/render-openscad.yml)**.

---

## 🛒 Bill of Materials

See [`bom/bom.csv`](bom/bom.csv) for the full BOM with 25 line items, quantities, specifications, and supplier suggestions.

---

## 🔧 Assembly

See [`docs/assembly_guide.md`](docs/assembly_guide.md) for the full 10-step assembly guide including:
- Rail alignment procedure and parallelism tolerance
- Lead screw runout check (≤ 0.3mm)
- Torque specs for all fasteners
- Troubleshooting table

---

## 🖨️ DXF Layers — Laser / Waterjet Guide

| Layer | Recommended Operation |
|---|---|
| `OUTLINE` | Profile cut (last operation) |
| `VWHEEL_FIXED` | Drill / pierce Ø5.0mm |
| `VWHEEL_ECCENTRIC` | Drill / pierce Ø7.8mm |
| `M3_HOLES` | Drill / pierce Ø3.2mm |
| `M4_HOLES` | Drill / pierce Ø4.3mm |
| `M5_HOLES` | Drill / pierce Ø5.3mm |
| `LEADSCREW` | Drill / pierce Ø9.0mm |
| `MGRID` | Drill / pierce Ø5.0mm |

> **Tip:** For tapped holes, drill undersize and tap after cutting:
> M3 → Ø2.5mm, M4 → Ø3.3mm, M5 → Ø4.2mm

---

## 📎 References

- [Bulkman3D PL0015 C-Beam Gantry Plate XL](https://bulkman3d.com/product/pl0015/)
- [Makita RT0702/700C Router Adapter — 3DPrintronics](https://www.3dprintronics.com/products/mounting-kit-for-makita-trim-router-rt0702-700c)
- [OpenBuilds C-Beam Extrusion](https://openbuildspartstore.com/c-beam-linear-rail/)
- [MGN9H Rail Datasheet — Hiwin](https://www.hiwin.com/pdf/linear_guideways/MG.pdf)
- [TR8×8 Lead Screw — RobotDigg](https://www.robotdigg.com)
- [OpenSCAD — Free CAD Software](https://openscad.org)

---

## 📄 License

This design is released under the [CERN Open Hardware Licence v2 - Permissive](https://ohwr.org/cern_ohl_p_v2.txt).
