# Assembly Guide — C-Beam Gantry with Dual Makita RT0702/700C

**Version:** 1.0  
**Date:** 2024  
**Plate File:** `cad/gantry_plate.dxf`  
**BOM:** `bom/bom.csv`

---

## ⚠️ Before You Start

- Read the entire guide before beginning assembly
- All dimensions are in **millimetres (mm)**
- Use **Loctite 243** (medium strength) on all M3 and M4 fasteners
- Torque M3 to **0.5 Nm**, M4 to **1.2 Nm**, M5 to **2.5 Nm**
- Check squareness at every step — errors compound

---

## 🛠️ Tools Required

- Allen key set (M3, M4, M5 hex drivers)
- Torque screwdriver
- Steel rule and square (150mm+)
- Dial indicator or feeler gauge (for rail alignment)
- Thread tap set (M3, M4, M5) — if tapping holes instead of using clearance + nut
- Deburring tool
- Isopropyl alcohol (cleaning)

---

## 📦 Parts Check

Before assembly, verify you have all items in [`bom/bom.csv`](../bom/bom.csv).
Inspect the gantry plate:
- [ ] All 29 holes present (16× M3, 4× M4, 8× M5, 1× Ø9mm)
- [ ] Plate edges deburred
- [ ] Plate faces flat (check with steel rule)
- [ ] No cracks or tool marks near holes

---

## Step 1 — Prepare the C-Beam Extrusion

1. Cut C-beam to your required Z-travel length + **100mm overhead clearance**.
2. Deburr all cut ends with a file.
3. Tap both ends **M5×0.8** (for end cap / bearing block mounting) if not pre-tapped.
4. Clean all T-slots with isopropyl alcohol.
5. Mark the **top** and **front** faces with tape labels — critical for correct orientation.

```
C-Beam orientation:
  Front face  → gantry plate travels here
  Back face   → motor and bearing blocks mount here
  Top         → FK8 fixed bearing block (motor end)
  Bottom      → FF8 float bearing block (idler end)
```

---

## Step 2 — Mount FK8 and FF8 Bearing Blocks

1. **FK8 (top / motor end):**
   - Align FK8 centrally on the top end of the C-beam back face
   - Insert 4× M5 T-nuts into the C-beam T-slot
   - Fasten with 4× M5×10mm SHCS — do not fully tighten yet

2. **FF8 (bottom / idler end):**
   - Repeat for FF8 at the bottom end
   - Leave both blocks loose for lead screw alignment in Step 5

---

## Step 3 — Mount MGN9H Linear Rails

> **Critical:** Rail parallelism directly determines carriage smoothness and plate squareness.

1. Insert M3 T-nuts into the C-beam front face T-slots — one every **40mm** along the rail length.
2. Place **Left Rail** at X = 20mm from the left edge of the C-beam face:
   - Use a precision square against the C-beam edge
   - Align rail straight — check with a dial indicator if available (tolerance: ±0.05mm)
   - Start fastening from the **centre outward**
   - Torque M3×8mm SHCS to **0.5 Nm**
3. Place **Right Rail** at X = 100mm (80mm from left rail centre):
   - Measure the 80mm spacing at **top, middle, and bottom** of rail length
   - All three measurements must match within **0.1mm**
   - Fasten centre-out, same torque
4. Run each MGN9H carriage along its rail full travel — motion must be **smooth with zero binding**.

---

## Step 4 — Attach Carriages to Gantry Plate

1. Lay the gantry plate **face down** on a flat surface.
2. Position the **4 MGN9H carriages** onto the back face M3 hole patterns:

   | Carriage | Plate X centre | Plate Y centre |
   |---|---|---|
   | Rail 1 – Top | 20mm | 40mm |
   | Rail 1 – Bottom | 20mm | 120mm |
   | Rail 2 – Top | 100mm | 40mm |
   | Rail 2 – Bottom | 100mm | 120mm |

3. Insert 4× M3×8mm SHCS per carriage (16 total).
4. Apply Loctite 243 to each screw thread.
5. Torque to **0.5 Nm** in a **cross pattern** (do not tighten sequentially).
6. Allow Loctite to cure **20 minutes** before proceeding.

---

## Step 5 — Install Lead Screw and Nut

1. **Mount TR8×8 nut to gantry plate:**
   - Position nut over the 4× M4 holes centred at (60, 80) on the plate
   - Insert 4× M4×8mm SHCS with Loctite 243
   - Torque to **1.2 Nm** in cross pattern
   - Ensure nut face is flush with plate back face — use a washer if needed

2. **Thread lead screw through nut:**
   - Insert TR8×8 lead screw through the nut from above
   - Thread smoothly by hand — no forcing

3. **Seat lead screw in bearing blocks:**
   - Lower screw end into FF8 float bearing (bottom)
   - Upper end into FK8 fixed bearing (top)
   - Now align FK8 and FF8 so screw runs **perfectly vertical** with zero side load
   - Tighten FK8 bolts fully. Tighten FF8 bolts fully.

4. **Check lead screw runout:**
   - Rotate screw by hand — gantry plate should travel smoothly with **no wobble**
   - Maximum acceptable runout: **0.3mm**

---

## Step 6 — Slide Plate onto Rails

1. With the 4 carriages attached to the plate, carefully slide the carriage blocks onto their respective rails.
2. Work on **one rail at a time** — hold the other rail carriages clear.
3. Once both rails are engaged, cycle the plate full travel by hand:
   - Motion must be **completely smooth** with no tight spots
   - If binding occurs, re-check rail parallelism (Step 3)

---

## Step 7 — Mount Stepper Motor

1. Attach flexible coupler to motor shaft (5mm end).
2. Mount NEMA17/NEMA23 motor to FK8 motor mount bracket:
   - 4× M3×8mm SHCS, Loctite 243, torque **0.5 Nm**
3. Slide 8mm end of coupler onto lead screw top.
4. Tighten coupler grub screws — ensure coupler is centred, not binding FK8 bearing.
5. Rotate motor shaft by hand — confirm smooth travel through full Z range.

---

## Step 8 — Mount Router Adapters

> Uses [3DPrintronics Makita RT0702/700C Mounting Kit](https://www.3dprintronics.com/products/mounting-kit-for-makita-trim-router-rt0702-700c)

1. **Adapter 1 (Upper)** — centred at plate (60, 40):
   - Align 4× M5 holes to plate holes at (30,20), (90,20), (30,60), (90,60)
   - Insert 4× M5×10mm SHCS
   - Torque to **2.5 Nm**

2. **Adapter 2 (Lower)** — centred at plate (60, 120):
   - Align 4× M5 holes to plate holes at (30,100), (90,100), (30,140), (90,140)
   - Insert 4× M5×10mm SHCS
   - Torque to **2.5 Nm**

3. Insert Makita RT0702/700C router through both clamps:
   - Router body Ø65mm fits both clamps
   - Position router so collet is at desired working depth
   - Tighten upper clamp first, then lower clamp
   - Check router is **perpendicular to work surface** with a square

---

## Step 9 — Cable Management

1. Mount drag chain bracket at **top of gantry plate** (2× M4 holes on top edge).
2. Mount second bracket at top of C-beam frame.
3. Route stepper motor cable and router power cable through drag chain.
4. Ensure chain has **minimum bend radius ≥ 28mm** (for 10×10mm chain).
5. Leave **50mm slack** at gantry plate end to allow full Z travel.

---

## Step 10 — Limit Switch Installation

1. Mount micro limit switch at the **top of the C-beam** (Z-home / max position).
2. Position switch so it triggers **5mm before** physical end of travel.
3. Route switch cable through drag chain alongside motor cable.
4. Test: manually trigger switch and verify controller response.

---

## ✅ Final Checks

- [ ] All 16× M3 screws torqued and Loctited
- [ ] All 4× M4 screws torqued and Loctited
- [ ] All 8× M5 screws torqued
- [ ] Lead screw runs smoothly — no binding, runout < 0.3mm
- [ ] Gantry plate travels full Z range — no binding
- [ ] Router perpendicular to work surface (check with square)
- [ ] Cables fully routed and secured — no snag points
- [ ] Limit switch tested and confirmed
- [ ] Motor coupling tight — no slip under manual load

---

## 🔧 Troubleshooting

| Symptom | Likely Cause | Fix |
|---|---|---|
| Binding during Z travel | Rails not parallel | Re-align rails, re-check 80mm spacing |
| Lead screw wobble | Bearing blocks misaligned | Loosen FK8/FF8, re-align with screw installed |
| Lost steps under load | Motor too small / current too low | Upgrade to NEMA23 or increase driver current |
| Backlash in Z | Brass nut worn or loose | Replace with anti-backlash POM nut |
| Router vibration | Clamp not tight / adapter flex | Tighten clamps, check M5 torque |
| Carriage screws loosening | No threadlocker used | Remove, clean, re-apply Loctite 243 |

---

## 📐 Reference Dimensions

```
Gantry plate:          120 × 160 × 8mm
Rail spacing (H):      80mm centre-to-centre
Carriage spacing (V):  80mm centre-to-centre
Lead screw centre:     X=60mm, Y=80mm (plate centre)
Router adapter 1:      X=60mm, Y=40mm
Router adapter 2:      X=60mm, Y=120mm
Router clamp bore:     Ø65mm
Lead screw clearance:  Ø9mm
```

---

*For questions or improvements, open an issue on the [GitHub repository](https://github.com/isankadal/cbeam-gantry-makita-router).*
