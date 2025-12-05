// =================================================================
// SNOW JOE HANDLE CAM LOCK REPLACEMENT - FEMALE PART (3D PRINTABLE)
// =================================================================
// Manufacturer: Snow Joe / Sun Joe
// Product: Ultra 21-Inch Electric Snow Thrower
// Model: SJ625E (Compatible with ION18SB series)
// Part Name: Handle Lock Base / Female Cam Lock / Pivot Joint Base
// OEM Part Number: ION18SB-9 (Mating part)
// Manual Reference: Part #8 (Handle locks) in SJ625E Exploded View
// Manual URL: https://files.snowjoe.com/product-manuals/SJ625EMANUAL_ENG11082017-V1.pdf
// 
// Designer: Theo Roe
// Date: December 5, 2025
// License: Creative Commons - Attribution (CC-BY)
// 
// SPECIFICATIONS:
// - Body: 70mm OD × 24mm H with 40 tooth slots
// - Floor Height: 20mm solid fill
// - Locking Box: 24mm × 31mm with 2mm raised edges
// - Hardware: M5 pivot bolt, 11mm OD compression spring
// 
// PRINT SETTINGS:
// - Material: PETG, ASA, or ABS (NOT PLA - cold/outdoor use)
// - Walls: Minimum 5 perimeters (2mm shell)
// - Infill: 40-100% (Gyroid recommended)
// - Supports: Required for horizontal sleeve and gussets
// - Orientation: Body flat on bed (largest face down)
// =================================================================

$fn = 100;

// ============================================================
// PRIMARY DIMENSIONS
// ============================================================

// Main body dimensions
Body_Height = 24;              // Total height of part
Body_OD = 70;                  // Outer diameter of body
Body_Fillet_Radius = 3;        // Fillet on outer edge
Body_Z_Offset = 2;             // Body raised above workplane for pocket flanges

Interior_Floor_Height = 19;    // Height of solid interior floor (gives 5mm teeth, 2mm clearance for 3mm male teeth)

// Tooth geometry (receives male part teeth)
Tooth_Count = 40;              // Number of teeth around circumference
Tooth_Width = 2.5;             // Width of each tooth
Tooth_Gap_Width = 2.5;         // Width of gap between teeth (2mm male teeth + 0.5mm clearance)
Teeth_Outer_Circle = 63;       // Diameter where teeth begin (matches male)
Tooth_Length = 7;              // How far teeth extend inward from rim

// Bolt and spring dimensions
Bolt_Hole_Diameter = 6;        // Diameter of center bolt
Bolt_Clearance = 0.5;          // Extra clearance for bolt
Bolt_Sleeve_OD = 13;           // OD of sleeve for spring (12mm spring + 1mm clearance)
Bolt_Sleeve_ID = 8.5;          // ID of sleeve (creates wall for 12mm OD spring to fit around)
// Spring specs: 12mm OD, 9mm ID, ~1.5mm wire gauge, 24mm total height (12mm per half)

// Locking mechanism pocket (receives locking tab)
Pocket_Width = 24;                // Pocket width (parallel to sleeve)
Pocket_Length = 31;               // Pocket length (perpendicular to sleeve)
// Pocket position set by its near-wall (the one closest to the bolt hole at X=0)
Pocket_Near_Wall_X = 9;           // Near wall of pocket cutout is 9mm from Bolt Hole (X=0)
Pocket_Start_X = Pocket_Near_Wall_X - Pocket_Width;   // Pocket Start X: 9mm - 24mm = -15mm
// **MODIFIED:** Definition for far flange extension
Pocket_Far_Extension = 10;        // How far the side flanges extend past the far pocket flange
Pocket_Flange_Width = 2;            // Width of raised flange around pocket
Pocket_Flange_Depth = 2;           // Depth of raised flange around pocket (sticks DOWN from body)

// Handle sleeve dimensions
Sleeve_Length = 50;            // Length of handle tube socket
Sleeve_Wall_Thick = 4.5;       // Wall thickness of sleeve
Sleeve_Corner_Rad = 4;         // Corner radius on sleeve
Sleeve_Tube_OD = 22;           // Handle tube outer diameter
Wiggle_Room = 1;               // Clearance for handle tube

// Screw boss dimensions (for handle securing screw, matches male part)
Screw_Hole_Dia = 5;            // Screw thread hole diameter
Screw_Hole_Margin = 12;        // Distance from end of sleeve
Screw_Head_Dia = 9;            // Screw head diameter
Boss_Wiggle = 2;               // Clearance around screw head
Boss_Wall_Thick = 3.5;         // Boss wall thickness
Boss_Height = 5;               // Boss height above sleeve

// Reinforcement dimensions
Gusset_Width = 15;             // Width of support gussets
Gusset_Height_Percent = 0.80;  // Gussets extend to 80% of sleeve height
Gusset_Outer_Fillet = 3;       // Fillet radius on gusset outer edge
Sleeve_Base_Thickening = 2;    // Extra wall thickness at sleeve base
Cross_Brace_Count = 3;         // Number of diagonal cross braces
Cross_Brace_Thickness = 3;     // Thickness of cross braces

// ============================================================
// CALCULATED DIMENSIONS
// ============================================================

// Tooth geometry
Teeth_Inner_Circle = Teeth_Outer_Circle - (2 * Tooth_Length);
Tooth_Height = Body_Height - Interior_Floor_Height;

// Pocket positioning
Pocket_Depth = 10;             // Fixed depth of pocket from bottom of body (excluding rim)

// Bolt positioning
Bolt_Center_X = 0;             // Centered on the main body
Bolt_Sleeve_Height = Tooth_Height;

// Screw boss
Boss_ID = Screw_Head_Dia + Boss_Wiggle;
Boss_OD = Boss_ID + (2 * Boss_Wall_Thick);
Screw_Hole_X = (30 + Sleeve_Length) - Screw_Hole_Margin - (Screw_Hole_Dia/2);

// Handle sleeve
Total_Hole_Dia = Sleeve_Tube_OD + Wiggle_Room;
Sleeve_Height = Total_Hole_Dia + (2 * Sleeve_Wall_Thick);
Sleeve_Width = Total_Hole_Dia + (2 * Sleeve_Wall_Thick);
Gusset_Actual_Height = Sleeve_Height * Gusset_Height_Percent;
Hole_Start_X = (Body_OD/2) + 10;

// ============================================================
// MODULES - Reusable Components
// ============================================================

module body_rim() {
    // Outer ring at full height, raised above workplane
    translate([0, 0, Body_Z_Offset])
    difference() {
        cylinder(d=Body_OD, h=Body_Height);
        // Hollow out center above interior floor
        translate([0, 0, Interior_Floor_Height])
            cylinder(d=Teeth_Outer_Circle, h=Tooth_Height + 1);
        // Outer edge fillet
        difference() {
            rotate_extrude() 
                translate([Body_OD/2, 0, 0]) 
                    square(Body_Fillet_Radius);
            rotate_extrude() 
                translate([Body_OD/2 - Body_Fillet_Radius, Body_Fillet_Radius, 0]) 
                    circle(r=Body_Fillet_Radius);
        }
    }
}

module interior_floor() {
    // Solid base inside teeth
    translate([0, 0, Body_Z_Offset])
    cylinder(d=Teeth_Inner_Circle, h=Interior_Floor_Height);
}

module teeth() {
    // Female teeth with gaps for male teeth to mesh
    translate([0, 0, Body_Z_Offset])
    for (i = [0 : Tooth_Count - 1]) {
        rotate([0, 0, i * (360 / Tooth_Count)]) {
            translate([
                0, 
                Teeth_Outer_Circle/2 - Tooth_Length/2, 
     
                Interior_Floor_Height + (Tooth_Height/2)
            ])
                cube([Tooth_Width, Tooth_Length, Tooth_Height], center=true);
        }
    }
}

module bolt_sleeve() {
    // Raised cylinder for spring to fit around
    translate([0, 0, Body_Z_Offset])
    difference() {
        translate([Bolt_Center_X, 0, Interior_Floor_Height]) // Uses Bolt_Center_X = 0
            cylinder(d=Bolt_Sleeve_OD, h=Bolt_Sleeve_Height);
        // Hollow center for spring
        translate([Bolt_Center_X, 0, Interior_Floor_Height - 1]) // Uses Bolt_Center_X = 0
            cylinder(d=Bolt_Sleeve_ID, h=Bolt_Sleeve_Height + 2);
    }
}

module pocket_flanges() {
    // **MODIFIED:** Calculate new ridge width and start position
    Pocket_Ridge_Width = Pocket_Width + Pocket_Far_Extension;
    Ridge_Start_X = Pocket_Start_X - Pocket_Far_Extension;
    
    // 3-sided raised flange frame around pocket (sits on workplane)
    
    // Left flange (Spans from Ridge_Start_X to Pocket_Near_Wall_X)
    translate([Ridge_Start_X, -(Pocket_Length/2) - Pocket_Flange_Width, 0])
        cube([Pocket_Ridge_Width, Pocket_Flange_Width, Pocket_Flange_Depth]);
    
    // Right flange (Spans from Ridge_Start_X to Pocket_Near_Wall_X)
    translate([Ridge_Start_X, (Pocket_Length/2), 0])
        cube([Pocket_Ridge_Width, Pocket_Flange_Width, Pocket_Flange_Depth]);
    
    // Near flange (Positioned at Pocket_Near_Wall_X)
    translate([Pocket_Near_Wall_X, -(Pocket_Length/2) - Pocket_Flange_Width, 0])
        cube([Pocket_Flange_Width, Pocket_Length + (2 * Pocket_Flange_Width), Pocket_Flange_Depth]);
}

module handle_sleeve() {
    // Extended to workplane for strength
    difference() {
        translate([30, 0, 0]) 
            rotate([90, 0, 90]) 
            linear_extrude(Sleeve_Length)
                hull() {
                    translate([-(Sleeve_Width/2) + Sleeve_Corner_Rad, Sleeve_Corner_Rad]) 
    
                    circle(r=Sleeve_Corner_Rad);
                    translate([(Sleeve_Width/2) - Sleeve_Corner_Rad, Sleeve_Corner_Rad]) 
                        circle(r=Sleeve_Corner_Rad);
                    translate([-(Sleeve_Width/2) + Sleeve_Corner_Rad, Sleeve_Height + Body_Z_Offset - Sleeve_Corner_Rad]) 
                        circle(r=Sleeve_Corner_Rad);
                    translate([(Sleeve_Width/2) - Sleeve_Corner_Rad, Sleeve_Height + Body_Z_Offset - Sleeve_Corner_Rad]) 
                        circle(r=Sleeve_Corner_Rad);
                }
        
        // Clearance notch for body
        translate([0, 0, Body_Height + Body_Z_Offset])
            cylinder(d=Body_OD + 0.5, h=Sleeve_Height);
    }
}

module wedge_fill() {
    // Solid support between sleeve and pocket flange
    hull() {
        // First cube is now aligned with the NEAR FLANGE of the new pocket position (Pocket_Near_Wall_X)
        translate([Pocket_Near_Wall_X, -(Pocket_Length/2), 0])
            cube([0.1, Pocket_Length, Body_Z_Offset]);
        // Second cube is at the sleeve base
        translate([30, -(Sleeve_Width/2), 0])
            cube([0.1, Sleeve_Width, Body_Z_Offset]);
    }
}

module screw_boss() {
    // Boss for handle screw
    translate([Screw_Hole_X, 0, Body_Z_Offset + Sleeve_Height - 2.0])
        cylinder(d=Boss_OD, h=Boss_Height + 2);
    // Boss reinforcement gusset
    hull() {
        translate([Screw_Hole_X, 0, Body_Z_Offset + Sleeve_Height - 2.0])
            cylinder(d=Boss_OD, h=0.5);
        translate([Screw_Hole_X - 8, 0, Body_Z_Offset + Sleeve_Height/2])
            cylinder(d=4, h=0.5);
    }
}

module side_gussets() {
    // Extended to workplane for strength
    
    // Side 1
    difference() {
        hull() {
            translate([Hole_Start_X, (Sleeve_Width/2) - 0.1, 0])
                cube([0.1, 0.1, Body_Height + Body_Z_Offset]);
            translate([20, (Sleeve_Width/2) + Gusset_Width, 0])
                 cylinder(r=2, h=Gusset_Actual_Height + Body_Z_Offset);
            translate([30, (Sleeve_Width/2) - 0.1, 0])
                cube([0.1, 0.1, Gusset_Actual_Height + Body_Z_Offset]);
        }
        // Outer bottom fillet
        translate([Hole_Start_X, (Sleeve_Width/2) + Gusset_Width + 10, Gusset_Outer_Fillet])
            rotate([0, 90, 0])
            cylinder(r=Gusset_Outer_Fillet, h=100);
    }

    // Side 2 (mirrored)
    mirror([0, 1, 0]) {
        difference() {
            hull() {
                translate([Hole_Start_X, (Sleeve_Width/2) - 0.1, 0])
                    cube([0.1, 0.1, Body_Height + Body_Z_Offset]);
                translate([20, (Sleeve_Width/2) + Gusset_Width, 0])
                     cylinder(r=2, h=Gusset_Actual_Height + Body_Z_Offset);
                translate([30, (Sleeve_Width/2) - 0.1, 0])
                    cube([0.1, 0.1, Gusset_Actual_Height + Body_Z_Offset]);
            }
            // Outer bottom fillet
            translate([Hole_Start_X, (Sleeve_Width/2) + Gusset_Width + 10, Gusset_Outer_Fillet])
                rotate([0, 90, 0])
                cylinder(r=Gusset_Outer_Fillet, h=100);
        }
    }
}

module cross_braces() {
    // Diagonal ribs for torsion resistance
    
    // Side 1
    for (i = [0 : Cross_Brace_Count - 1]) {
        hull() {
            translate([30 + (i * 10), (Sleeve_Width/2) - Cross_Brace_Thickness/2, 0])
                cube([Cross_Brace_Thickness, Cross_Brace_Thickness, 0.1]);
            translate([25 + (i * 8), (Sleeve_Width/2) - Cross_Brace_Thickness/2, Body_Z_Offset + 5])
                cube([Cross_Brace_Thickness, Cross_Brace_Thickness, 0.1]);
        }
    }
    
    // Side 2 (mirrored)
    mirror([0, 1, 0]) {
        for (i = [0 : Cross_Brace_Count - 1]) {
            hull() {
                translate([30 + (i * 10), (Sleeve_Width/2) - Cross_Brace_Thickness/2, 0])
                
                cube([Cross_Brace_Thickness, Cross_Brace_Thickness, 0.1]);
                translate([25 + (i * 8), (Sleeve_Width/2) - Cross_Brace_Thickness/2, Body_Z_Offset + 5])
                    cube([Cross_Brace_Thickness, Cross_Brace_Thickness, 0.1]);
            }
        }
    }
}

// ============================================================
// MAIN ASSEMBLY
// ============================================================

difference() {
    
    // POSITIVE GEOMETRY
    union() {
        body_rim();
        interior_floor();
        teeth();
        bolt_sleeve();
        pocket_flanges();
        handle_sleeve();
        wedge_fill();
        screw_boss();
        side_gussets();
        cross_braces();
    } // End positive geometry
    
    // ============================================================
    // NEGATIVE GEOMETRY (HOLES AND CUTOUTS)
    // ============================================================
    union() {
        // Pocket cutout (starts at Pocket_Start_X = -15, ends at x=9)
        translate([Pocket_Start_X, -(Pocket_Length/2), Body_Z_Offset - 1])
            cube([Pocket_Width, Pocket_Length, Pocket_Depth + 1]);
        // Center bolt hole (Uses Bolt_Center_X = 0)
        translate([Bolt_Center_X, 0, -1])
            cylinder(d=Bolt_Hole_Diameter + Bolt_Clearance, h=Body_Height + Body_Z_Offset + 2);
        // Handle tube socket
        translate([Hole_Start_X, 0, Body_Z_Offset + Sleeve_Height/2]) 
            rotate([0, 90, 0]) 
            cylinder(d=Total_Hole_Dia, h=Sleeve_Length, center=false);
        // Clearance for sleeve base thickening
        translate([30, 0, Body_Z_Offset + Sleeve_Height/2])
            rotate([0, 90, 0])
            cylinder(d=Total_Hole_Dia + 2, h=Sleeve_Base_Thickening, center=false);
        // Handle screw thread hole
        translate([Screw_Hole_X, 0, Body_Z_Offset + Sleeve_Height/2])
            cylinder(d=Screw_Hole_Dia, h=Sleeve_Height + Boss_Height + 5, center=false);
        // Handle screw head counterbore
        translate([Screw_Hole_X, 0, Body_Z_Offset + Sleeve_Height])
            cylinder(d=Boss_ID, h=Boss_Height + 1, center=false);
    }
    
} // End main assembly difference

// ============================================================
// PRINT NOTES:
// - Print with body flat on bed
// - Use supports for sleeve and gussets
// - Material: PETG, ASA, or ABS (NOT PLA - outdoor/cold use)
// - Settings: 4-5 perimeters, 50-100% infill, 0.2mm layers
// ============================================================