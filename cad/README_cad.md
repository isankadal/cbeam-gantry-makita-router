# CAD Files

## Files

| File | Type | Description |
|---|---|---|
| `gantry_plate.dxf` | DXF (AC1009) | Rev C gantry plate — laser/waterjet ready, 5+ layers |
| `gantry_assembly.scad` | OpenSCAD | Full 3D parametric assembly model |

---

## Opening the OpenSCAD Model

1. Download and install [OpenSCAD](https://openscad.org/downloads.html) (free, cross-platform)
2. Open `gantry_assembly.scad`
3. Press **F5** for fast preview (OpenCSG)
4. Press **F6** for full render (CGAL — slower but accurate)
5. Export: **File → Export → Export as STL / DXF / SVG**

---

## Parametric Controls

Edit the top section of `gantry_assembly.scad` to adjust:

```openscad
// Show/hide individual components
SHOW_CBEAM           = true;
SHOW_GANTRY_PLATE    = true;
SHOW_VWHEELS         = true;
SHOW_MGN9H_RAILS     = true;
SHOW_MGN9H_CARRIAGES = true;
SHOW_LEADSCREW       = true;
SHOW_NUT_BLOCK       = true;
SHOW_BEARING_BLOCKS  = true;
SHOW_MOTOR           = true;
SHOW_ROUTER_MOUNTS   = true;
SHOW_ROUTERS         = true;

// Key dimensions
CBEAM_L = 300;   // C-beam length / Z-travel (mm) — adjust to your build
$fn     = 48;    // Cylinder smoothness (increase to 128 for final render)
```

---

## Assembly Components Modelled

| Component | Module | Notes |
|---|---|---|
| C-Beam 40×80mm | `cbeam()` | Simplified with slots/grooves |
| PL0015 Gantry Plate 125×125×6mm | `gantry_plate()` | With all clearance holes |
| 6× V-Wheels | `vwheel()` | 3 fixed + 3 eccentric |
| 2× MGN9H Rails | `mgn9h_rail()` | On left & right 40mm side faces |
| 4× MGN9H H-Block Carriages | `mgn9h_carriage()` | Bolted to plate back face |
| TR8×8 Lead Screw | `lead_screw()` | Runs full C-beam length |
| TR8×8 Nut Block | `nut_block()` | Centred at plate (62.5, 62.5) |
| FK8 + FF8 Bearing Blocks | `fk8_block()` | Top (motor) and bottom (idler) |
| NEMA17 Stepper Motor | `nema17()` | With pilot boss and shaft |
| Flexible Shaft Coupler | `coupler()` | 5mm→8mm |
| 2× Router Clamp Adapters | `router_clamp_adapter()` | 65mm bore |
| Makita RT0702/700C | `makita_router()` | Simplified body |

---

## DXF Layer Reference

| Layer | Colour | Dia | Qty | Purpose |
|---|---|---|---|---|
| `OUTLINE` | White | — | 1 | Plate cut boundary 125×125mm |
| `VWHEEL_FIXED` | Cyan | Ø5.0mm | 3 | Fixed V-wheel M5 holes |
| `VWHEEL_ECCENTRIC` | Green | Ø7.8mm | 3 | Eccentric spacer holes |
| `M3_HOLES` | Red | Ø3.2mm | 16 | MGN9H carriage bolts |
| `M4_HOLES` | Yellow | Ø4.3mm | 4 | TR8×8 nut block bolts |
| `M5_HOLES` | Blue | Ø5.3mm | 8 | Makita adapter bolts |
| `LEADSCREW` | Magenta | Ø9.0mm | 1 | Lead screw shaft clearance |
| `MGRID` | Grey | Ø5.0mm | 14 | M5 utility grid (20mm pitch) |
