// =================================================================
// SNOW JOE HANDLE CAM LOCK REPLACEMENT - MALE PART (3D PRINTABLE)
// =================================================================
// Manufacturer: Snow Joe / Sun Joe
// Product: Ultra 21-Inch Electric Snow Thrower
// Model: SJ625E (Compatible with ION18SB series)
// Part Name: Handle Lock / Handle Cam Lock / Pivot Joint
// OEM Part Number: ION18SB-9
// Manual Reference: Part #8 (Handle locks) in SJ625E Exploded View
// Manual URL: https://files.snowjoe.com/product-manuals/SJ625EMANUAL_ENG11082017-V1.pdf
// 
// Designer: Theo Roe
// Date: December 5, 2025
// License: Creative Commons - Attribution (CC-BY)
// 
// SPECIFICATIONS:
// - Body: 70mm OD × 15mm H with 40 locking teeth
// - Hub: 18.5mm OD × 18mm H with spring groove
// - Sleeve: 50mm L for 22mm handle tube with M5 retention screw
// - Hardware: M5 pivot bolt, 11mm OD compression spring
// 
// PRINT SETTINGS:
// - Material: PETG, ASA, or ABS (NOT PLA - cold/outdoor use)
// - Walls: Minimum 5 perimeters (2mm shell)
// - Infill: 40-100% (Gyroid recommended)
// - Supports: None required if printed flat
// - Orientation: Body flat on bed, teeth pointing up
// =================================================================

$fn = 100;

// ============================================================
// PRIMARY DIMENSIONS
// ============================================================

// Main body dimensions
Body_Height = 15;              // Total height of main disk
Body_OD = 70;                  // Outer diameter of body
Body_Fillet_Radius = 3;        // Fillet on outer edge

// Center hub dimensions
Center_Hub_Height = 18;        // Total height of center hub
Center_Hub_OD = 18.5;          // Outer diameter of center hub
Bolt_Hole_Diameter = 6;        // Diameter of center bolt

// Bottom counterbore (for bolt head)
Bottom_Counter_Dia = 10;       // Diameter of counterbore
Bottom_Counter_Dep = 10;       // Depth of counterbore

// Spring groove dimensions
Groove_Floor_Height = 6;       // Height where groove starts (allows 12mm spring depth)
Spring_Groove_OD = 12.5;       // Outer diameter of groove (12mm spring + 0.5mm clearance)
Spring_Groove_ID = 8.5;        // Inner diameter of groove (9mm spring ID - 0.5mm for center post)
// Spring specs: 12mm OD, 9mm ID, ~1.5mm wire gauge, 24mm total height (12mm per half)

// Tooth geometry (engages with female part)
Tooth_Count = 40;              // Number of teeth around circumference
Tooth_Length = 6;              // How far teeth extend outward from hub
Tooth_Width = 2.0;             // Width of each tooth
Teeth_Outer_Circle = 63;       // Diameter where teeth reach (matches female)
Tooth_Fillet_Radius = 0.8;     // Fillet at tooth base for stress relief

// Handle sleeve dimensions
Sleeve_Length = 50;            // Length of handle tube socket
Sleeve_Wall_Thick = 4.5;       // Wall thickness of sleeve
Sleeve_Corner_Rad = 4;         // Corner radius on sleeve
Sleeve_Tube_OD = 22;           // Handle tube outer diameter
Wiggle_Room = 1;               // Clearance for handle tube

// Screw boss dimensions (for handle securing screw)
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

// ============================================================
// CALCULATED DIMENSIONS
// ============================================================

// Tooth geometry
Teeth_Inner_Circle = Teeth_Outer_Circle - (2 * Tooth_Length);
Tooth_Projection_Height = Center_Hub_Height - Body_Height;  // Height teeth project above body

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
// MAIN GEOMETRY
// ============================================================

// ============================================================
// MAIN ASSEMBLY
// ============================================================

difference() {
    
    // POSITIVE GEOMETRY
    union() {
        
        // ====================================================
        // BODY WITH TEETH
        // ====================================================
        difference() {
            union() {
                // Main body disk
                cylinder(d=Body_OD, h=Body_Height);
                
                // Center hub
                translate([0,0,0]) 
                    cylinder(d=Center_Hub_OD, h=Center_Hub_Height);
                
                // Teeth with base fillets for stress relief
                for (i = [0 : Tooth_Count - 1]) {
                    rotate([0, 0, i * (360 / Tooth_Count)]) { 
                        // Main tooth body
                        translate([0, (Teeth_Outer_Circle/2) - (Tooth_Length/2), Body_Height + (Tooth_Projection_Height/2)])
                            cube([Tooth_Width, Tooth_Length, Tooth_Projection_Height], center=true);
                        
                        // Fillet at tooth base for stress relief
                        translate([0, (Teeth_Inner_Circle/2), Body_Height])
                            cylinder(r=Tooth_Fillet_Radius, h=Tooth_Projection_Height);
                    }
                }
            } 
            
            // Body outer fillet
            difference() {
                rotate_extrude() 
                    translate([Body_OD/2, 0, 0]) 
                        square(Body_Fillet_Radius); 
                rotate_extrude() 
                    translate([Body_OD/2 - Body_Fillet_Radius, Body_Fillet_Radius, 0]) 
                        circle(r=Body_Fillet_Radius); 
            }
        } 

        // ====================================================
        // SLEEVE
        // ====================================================
        difference() {
            translate([30, 0, 0]) 
                rotate([0, 0, 0])
                rotate([90, 0, 90]) 
                linear_extrude(Sleeve_Length)
                    hull() {
                        translate([-(Sleeve_Width/2) + Sleeve_Corner_Rad, Sleeve_Corner_Rad]) 
                            circle(r=Sleeve_Corner_Rad);
                        translate([(Sleeve_Width/2) - Sleeve_Corner_Rad, Sleeve_Corner_Rad]) 
                            circle(r=Sleeve_Corner_Rad);
                        translate([-(Sleeve_Width/2) + Sleeve_Corner_Rad, Sleeve_Height - Sleeve_Corner_Rad]) 
                            circle(r=Sleeve_Corner_Rad);
                        translate([(Sleeve_Width/2) - Sleeve_Corner_Rad, Sleeve_Height - Sleeve_Corner_Rad]) 
                            circle(r=Sleeve_Corner_Rad);
                    }
            
            // Concave clearance cut
            translate([0,0, Body_Height])
                cylinder(d=Body_OD + 0.5, h=Sleeve_Height);
            
            // Embossed text on sleeve (indented 0.5mm)
            translate([55, 0, Sleeve_Height - 3])
                rotate([90, 0, 90])
                linear_extrude(height = 0.5)
                    text("SJ625E", size=4, halign="center", valign="center", font="Liberation Sans:style=Bold");
        }
        
        // ====================================================
        // SCREW BOSS WITH REINFORCEMENT
        // ====================================================
        translate([Screw_Hole_X, 0, Sleeve_Height - 2.0])
             cylinder(d=Boss_OD, h=Boss_Height + 2); 

        // Boss reinforcement gusset
        hull() {
            translate([Screw_Hole_X, 0, Sleeve_Height - 2.0])
                cylinder(d=Boss_OD, h=0.5);
            translate([Screw_Hole_X - 8, 0, Sleeve_Height/2])
                cylinder(d=4, h=0.5);
        }

        // ====================================================
        // SIDE GUSSETS (taller and wider with outer fillet)
        // ====================================================
        
        // Gusset side 1
        difference() {
            hull() {
                translate([Hole_Start_X, (Sleeve_Width/2) - 0.1, Gusset_Outer_Fillet])
                    cube([0.1, 0.1, Body_Height - Gusset_Outer_Fillet]); 
                translate([20, (Sleeve_Width/2) + Gusset_Width, Gusset_Outer_Fillet])
                     cylinder(r=2, h=Gusset_Actual_Height - Gusset_Outer_Fillet); 
                translate([30, (Sleeve_Width/2) - 0.1, Gusset_Outer_Fillet])
                    cube([0.1, 0.1, Gusset_Actual_Height - Gusset_Outer_Fillet]);
            }
            // Fillet the bottom outer edge
            translate([Hole_Start_X, (Sleeve_Width/2) + Gusset_Width + 10, Gusset_Outer_Fillet])
                rotate([0, 90, 0])
                cylinder(r=Gusset_Outer_Fillet, h=100);
        }

        // Gusset side 2 (mirrored)
        mirror([0, 1, 0]) {
            difference() {
                hull() {
                    translate([Hole_Start_X, (Sleeve_Width/2) - 0.1, Gusset_Outer_Fillet])
                        cube([0.1, 0.1, Body_Height - Gusset_Outer_Fillet]); 
                    translate([20, (Sleeve_Width/2) + Gusset_Width, Gusset_Outer_Fillet])
                         cylinder(r=2, h=Gusset_Actual_Height - Gusset_Outer_Fillet); 
                    translate([30, (Sleeve_Width/2) - 0.1, Gusset_Outer_Fillet])
                        cube([0.1, 0.1, Gusset_Actual_Height - Gusset_Outer_Fillet]);
                }
                // Fillet the bottom outer edge
                translate([Hole_Start_X, (Sleeve_Width/2) + Gusset_Width + 10, Gusset_Outer_Fillet])
                    rotate([0, 90, 0])
                    cylinder(r=Gusset_Outer_Fillet, h=100);
            }
        }

    } // End positive geometry

    // ============================================================
    // NEGATIVE GEOMETRY (HOLES AND GROOVES)
    // ============================================================

    // Center pivot bolt hole
    translate([0,0,-1])
        cylinder(d=Bolt_Hole_Diameter, h=Center_Hub_Height + 2);

    // Bottom bolt counterbore
    translate([0,0,-0.1]) 
        cylinder(d=Bottom_Counter_Dia, h=Bottom_Counter_Dep + 0.1);

    // Spring groove
    translate([0,0, Groove_Floor_Height])
        difference() {
            cylinder(d=Spring_Groove_OD, h=Center_Hub_Height + 5); 
            translate([0,0,-1])
                cylinder(d=Spring_Groove_ID, h=Center_Hub_Height + 10);
        }

    // Spring groove entry chamfer for easier assembly
    translate([0,0, Groove_Floor_Height - 0.5])
        difference() {
            cylinder(d1=Spring_Groove_OD + 1, d2=Spring_Groove_OD, h=1); 
            translate([0,0,-1])
                cylinder(d=Spring_Groove_ID, h=3);
        }

    // Handle tube socket
    translate([Hole_Start_X, 0, Sleeve_Height/2]) 
        rotate([0, 90, 0]) 
        cylinder(d=Total_Hole_Dia, h=Sleeve_Length, center=false);

    // Handle screw thread hole
    translate([Screw_Hole_X, 0, Sleeve_Height/2])
        cylinder(d=Screw_Hole_Dia, h=Sleeve_Height + Boss_Height + 5, center=false);
        
    // Handle screw head counterbore
    translate([Screw_Hole_X, 0, Sleeve_Height])
        cylinder(d=Boss_ID, h=Boss_Height + 1, center=false);
        
} // End main assembly difference

// ============================================================
// PRINT RECOMMENDATIONS:
// - Print with body flat on bed (teeth pointing up)
// - Use supports for sleeve and boss
// - Material: PETG, ASA, or ABS (NOT PLA for outdoor use)
// - Settings: 4-5 perimeters, 50-100% infill, 0.2mm layers
// ============================================================