// =============================================================
// C-BEAM GANTRY ASSEMBLY — Full 3D Model
// Rev C — Bulkman3D PL0015 Base Plate
// Configuration:
//   - C-Beam 40x80mm extrusion
//   - Bulkman3D PL0015 gantry plate 125x125x6mm
//   - 2x MGN9H linear rails on C-beam SIDE faces (40mm faces)
//   - 4x MGN9H H-block carriages (2 per rail)
//   - TR8x8 Acme lead screw + brass nut block
//   - 2x Makita RT0702/700C 65mm router clamp adapters
//   - FK8 + FF8 bearing blocks
//   - NEMA17 stepper motor
// =============================================================
// USAGE:
//   Open in OpenSCAD (https://openscad.org)
//   Press F5 to preview, F6 to render
//   Use the SHOW_* toggles below to isolate components
// =============================================================

// --- Display toggles ---
SHOW_CBEAM          = true;
SHOW_GANTRY_PLATE   = true;
SHOW_VWHEELS        = true;
SHOW_MGN9H_RAILS    = true;
SHOW_MGN9H_CARRIAGES= true;
SHOW_LEADSCREW      = true;
SHOW_NUT_BLOCK      = true;
SHOW_BEARING_BLOCKS = true;
SHOW_MOTOR          = true;
SHOW_ROUTER_MOUNTS  = true;
SHOW_ROUTERS        = true;

// --- Global parameters ---
$fn = 48;  // Cylinder smoothness (increase for final render)

// --- Key dimensions (mm) ---
CBEAM_W     = 80;    // C-beam width  (front face)
CBEAM_H     = 40;    // C-beam height (side face — rail mounting face)
CBEAM_L     = 300;   // C-beam length (Z travel). Adjust as needed.
CBEAM_WALL  = 3.2;   // Wall thickness approx

PLATE_W     = 125;   // Gantry plate width  (X)
PLATE_H     = 125;   // Gantry plate height (Y)
PLATE_T     = 6;     // Gantry plate thickness

RAIL_W      = 9;     // MGN9H rail width
RAIL_H      = 6.5;   // MGN9H rail height
CARR_L      = 27;    // MGN9H H-block carriage length
CARR_W      = 20;    // MGN9H H-block carriage width
CARR_H      = 8;     // MGN9H H-block carriage height

LS_DIA      = 8;     // Lead screw diameter
LS_LENGTH   = CBEAM_L + 80;  // Lead screw length (overhangs both ends)

NUT_W       = 22;    // Nut block width
NUT_D       = 22;    // Nut block depth
NUT_H       = 10;    // Nut block height

FK8_W       = 32;    // FK8 bearing block width
FK8_D       = 20;    // FK8 depth
FK8_H       = 20;    // FK8 height

MOTOR_W     = 42;    // NEMA17 width
MOTOR_D     = 42;    // NEMA17 depth
MOTOR_L     = 40;    // NEMA17 length
MOTOR_SHAFT = 22;    // Motor shaft length
MOTOR_SHAFT_D = 5;   // Motor shaft diameter

ROUTER_DIA  = 65;    // Makita body diameter
ROUTER_L    = 110;   // Makita body length (visible clamped portion)
CLAMP_T     = 8;     // Router clamp adapter thickness
CLAMP_W     = 80;    // Router clamp adapter width
CLAMP_H     = 30;    // Router clamp adapter height

VW_DIA      = 15.23; // Solid V-Wheel outer diameter
VW_T        = 10.2;  // Solid V-Wheel thickness

// --- Derived positions ---
// Assembly origin: bottom-left-front corner of C-beam
// X = left-right (plate width direction)
// Y = front-back (plate thickness / depth into C-beam)
// Z = up-down    (travel direction)

PLATE_Z_POS = CBEAM_L / 2;  // Plate starts at mid-travel for preview

// Plate sits on front face of C-beam, centred
PLATE_X = (CBEAM_W - PLATE_W) / 2;  // -22.5 (plate wider than cbeam)
PLATE_Y = -PLATE_T;                  // plate front face flush with cbeam front
PLATE_Z = PLATE_Z_POS;

// Rail positions — on LEFT and RIGHT 40mm side faces of C-beam
// Rail 1: left side face  X = -RAIL_H (outside left)
// Rail 2: right side face X =  CBEAM_W (outside right)
RAIL1_X = -RAIL_H;
RAIL2_X =  CBEAM_W;
RAIL_Y  =  CBEAM_H / 2 - RAIL_W / 2;  // Centred on 40mm face

// Lead screw centred in C-beam hollow
LS_X = CBEAM_W / 2;  // 40mm
LS_Y = CBEAM_H / 2;  // 20mm

// =============================================================
// MODULES
// =============================================================

// --- C-Beam extrusion (simplified box with hollow) ---
module cbeam(length) {
    color("silver", 0.85)
    difference() {
        cube([CBEAM_W, CBEAM_H, length]);
        // Main hollow
        translate([CBEAM_WALL, CBEAM_WALL, -1])
            cube([CBEAM_W - 2*CBEAM_WALL, CBEAM_H - 2*CBEAM_WALL, length + 2]);
        // Front V-slot groove (centre of 80mm face)
        translate([CBEAM_W/2 - 6, -1, -1])
            cube([12, CBEAM_WALL + 2, length + 2]);
        // Rear V-slot groove
        translate([CBEAM_W/2 - 6, CBEAM_H - CBEAM_WALL - 1, -1])
            cube([12, CBEAM_WALL + 2, length + 2]);
        // Left T-slot groove
        translate([-1, CBEAM_H/2 - 6, -1])
            cube([CBEAM_WALL + 2, 12, length + 2]);
        // Right T-slot groove
        translate([CBEAM_W - CBEAM_WALL - 1, CBEAM_H/2 - 6, -1])
            cube([CBEAM_WALL + 2, 12, length + 2]);
    }
}

// --- Gantry plate (PL0015 125x125x6mm) ---
module gantry_plate() {
    color("dimgray", 0.95)
    difference() {
        translate([0, 0, 0])
            cube([PLATE_W, PLATE_T, PLATE_H]);
        // Lead screw clearance hole Ø9mm at plate centre
        translate([PLATE_W/2, -1, PLATE_H/2])
            rotate([-90, 0, 0])
                cylinder(d=9, h=PLATE_T + 2);
        // V-wheel holes (front face) — 3 fixed Ø5mm
        translate([20, -1, 105])   rotate([-90,0,0]) cylinder(d=5, h=PLATE_T+2);
        translate([105, -1, 105])  rotate([-90,0,0]) cylinder(d=5, h=PLATE_T+2);
        translate([20, -1, 20])    rotate([-90,0,0]) cylinder(d=5, h=PLATE_T+2);
        // V-wheel eccentric holes Ø7.8mm
        translate([62.5, -1, 115]) rotate([-90,0,0]) cylinder(d=7.8, h=PLATE_T+2);
        translate([62.5, -1, 10])  rotate([-90,0,0]) cylinder(d=7.8, h=PLATE_T+2);
        translate([115, -1, 62.5]) rotate([-90,0,0]) cylinder(d=7.8, h=PLATE_T+2);
    }
}

// --- V-Wheel ---
module vwheel() {
    color("black")
    rotate([0, 90, 0])
    difference() {
        cylinder(d=VW_DIA, h=VW_T, center=true);
        cylinder(d=5.1, h=VW_T+1, center=true);
    }
}

// --- MGN9H Rail ---
module mgn9h_rail(length) {
    color("steelblue", 0.9)
    cube([RAIL_H, RAIL_W, length]);
}

// --- MGN9H Carriage (H-block) ---
module mgn9h_carriage() {
    color("dodgerblue")
    translate([-( CARR_H - RAIL_H)/2, -(CARR_W - RAIL_W)/2, 0])
        cube([CARR_H, CARR_W, CARR_L]);
}

// --- TR8x8 Lead Screw ---
module lead_screw(length) {
    color("goldenrod")
    cylinder(d=LS_DIA, h=length);
}

// --- Lead Screw Nut Block ---
module nut_block() {
    color("gold")
    difference() {
        translate([-NUT_W/2, -NUT_D/2, 0])
            cube([NUT_W, NUT_D, NUT_H]);
        cylinder(d=LS_DIA + 0.4, h=NUT_H + 2, center=false);
    }
}

// --- FK8 Fixed Bearing Block ---
module fk8_block() {
    color("lightgray")
    difference() {
        translate([-FK8_W/2, -FK8_D/2, 0])
            cube([FK8_W, FK8_D, FK8_H]);
        cylinder(d=LS_DIA + 0.2, h=FK8_H + 2, center=false);
    }
}

// --- NEMA17 Stepper Motor ---
module nema17() {
    color("#222222")
    union() {
        translate([-MOTOR_W/2, -MOTOR_D/2, 0])
            cube([MOTOR_W, MOTOR_D, MOTOR_L]);
        // Shaft
        translate([0, 0, MOTOR_L])
            cylinder(d=MOTOR_SHAFT_D, h=MOTOR_SHAFT);
        // Pilot boss
        translate([0, 0, MOTOR_L])
            cylinder(d=22, h=2);
    }
}

// --- Flexible Coupler ---
module coupler() {
    color("green", 0.8)
    difference() {
        cylinder(d=18, h=25, center=false);
        translate([0, 0, -1]) cylinder(d=MOTOR_SHAFT_D + 0.2, h=14);
        translate([0, 0, 12]) cylinder(d=LS_DIA + 0.2, h=14);
    }
}

// --- Makita Router Clamp Adapter ---
module router_clamp_adapter() {
    color("#333399", 0.85)
    difference() {
        translate([-CLAMP_W/2, -CLAMP_T, -CLAMP_H/2])
            cube([CLAMP_W, CLAMP_T, CLAMP_H]);
        // 65mm bore for router body
        rotate([90, 0, 0])
            cylinder(d=ROUTER_DIA, h=CLAMP_T + 2);
    }
}

// --- Makita RT0702/700C Router Body ---
module makita_router() {
    color("#1a6e1a", 0.75)
    union() {
        // Main body cylinder
        rotate([90, 0, 0])
            cylinder(d=ROUTER_DIA - 1, h=ROUTER_L);
        // Motor housing top
        translate([0, -ROUTER_L, 0])
        rotate([90, 0, 0])
            cylinder(d=ROUTER_DIA * 0.7, h=30);
        // Collet / bit stub
        translate([0, 20, 0])
        rotate([90, 0, 0])
            cylinder(d=8, h=25);
    }
}

// =============================================================
// ASSEMBLY
// =============================================================

// 1. C-Beam — positioned at origin, runs in Z
translate([0, 0, 0]) {
    if (SHOW_CBEAM)
        cbeam(CBEAM_L);

    // 2. FK8 Fixed bearing block — top (motor end)
    if (SHOW_BEARING_BLOCKS) {
        translate([LS_X, LS_Y, CBEAM_L])
            fk8_block();
        // FF8 Float bearing block — bottom (idler end)
        translate([LS_X, LS_Y, -FK8_H])
            fk8_block();
    }

    // 3. Lead screw — runs full length through C-beam
    if (SHOW_LEADSCREW)
        translate([LS_X, LS_Y, -FK8_H])
            lead_screw(LS_LENGTH);

    // 4. NEMA17 motor — sits above FK8 on top end
    if (SHOW_MOTOR)
        translate([LS_X, LS_Y, CBEAM_L + FK8_H + 2])
            rotate([180, 0, 0])
                nema17();

    // 5. Flexible coupler
    if (SHOW_MOTOR)
        translate([LS_X, LS_Y, CBEAM_L + FK8_H - 3])
            coupler();

    // 6. MGN9H Rails on left and right side 40mm faces
    if (SHOW_MGN9H_RAILS) {
        // Rail 1 — left side face
        translate([RAIL1_X, RAIL_Y, 0])
            mgn9h_rail(CBEAM_L);
        // Rail 2 — right side face
        translate([RAIL2_X, RAIL_Y, 0])
            mgn9h_rail(CBEAM_L);
    }

    // 7. Gantry plate — front face of C-beam, centred in X, at PLATE_Z
    // Plate X origin offset so plate centre aligns with C-beam centre
    translate([PLATE_X, PLATE_Y, PLATE_Z]) {

        if (SHOW_GANTRY_PLATE)
            gantry_plate();

        // 8. V-Wheels on front face of plate (C-beam front 80mm face)
        if (SHOW_VWHEELS) {
            VW_OFFSET = -VW_T/2 - 1;  // wheels proud of plate front face
            // Fixed wheel positions (relative to plate origin)
            translate([20,  VW_OFFSET, 105]) vwheel();
            translate([105, VW_OFFSET, 105]) vwheel();
            translate([20,  VW_OFFSET, 20])  vwheel();
            // Eccentric wheel positions
            translate([62.5, VW_OFFSET, 115]) vwheel();
            translate([62.5, VW_OFFSET, 10])  vwheel();
            translate([115,  VW_OFFSET, 62.5]) vwheel();
        }

        // 9. MGN9H Carriages — bolted to back face of plate
        if (SHOW_MGN9H_CARRIAGES) {
            CARR_Y_BACK = PLATE_T;  // back face of plate
            // Rail 1 carriages (left)
            R1_PLATE_X = 25 - PLATE_X - CARR_H/2;  // carriage centre on plate
            translate([R1_PLATE_X, CARR_Y_BACK, 95 - CARR_L/2])  mgn9h_carriage();
            translate([R1_PLATE_X, CARR_Y_BACK, 30 - CARR_L/2])  mgn9h_carriage();
            // Rail 2 carriages (right)
            R2_PLATE_X = 100 - PLATE_X - CARR_H/2;
            translate([R2_PLATE_X, CARR_Y_BACK, 95 - CARR_L/2])  mgn9h_carriage();
            translate([R2_PLATE_X, CARR_Y_BACK, 30 - CARR_L/2])  mgn9h_carriage();
        }

        // 10. Lead screw nut block — centred on plate at (62.5, -, 62.5)
        if (SHOW_NUT_BLOCK)
            translate([62.5, PLATE_T, 62.5])
                rotate([90, 0, 0])
                    nut_block();

        // 11. Router clamp adapters — front face of plate
        if (SHOW_ROUTER_MOUNTS) {
            // Adapter 1 upper (plate Y-centre = 95)
            translate([62.5, 0, 95])
                router_clamp_adapter();
            // Adapter 2 lower (plate Y-centre = 30)
            translate([62.5, 0, 30])
                router_clamp_adapter();
        }

        // 12. Makita router body — through both clamps
        if (SHOW_ROUTERS)
            translate([62.5, -30, 62.5])
                makita_router();
    }
}

// =============================================================
// ECHO: key dimensions for verification
// =============================================================
echo(str("C-Beam length         : ", CBEAM_L, " mm"));
echo(str("Plate size            : ", PLATE_W, " x ", PLATE_H, " x ", PLATE_T, " mm"));
echo(str("Rail 1 X (left side)  : ", RAIL1_X, " mm from C-beam origin"));
echo(str("Rail 2 X (right side) : ", RAIL2_X, " mm from C-beam origin"));
echo(str("Lead screw centre X/Y : (", LS_X, ", ", LS_Y, ") mm"));
echo(str("Plate Z preview pos   : ", PLATE_Z_POS, " mm"));
