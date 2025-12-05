# Snow Joe Handle Cam Lock Replacement

3D printable replacement parts for the Snow Joe SJ625E handle cam lock mechanism (pivot joint).

## Part Information

**Manufacturer:** Snow Joe / Sun Joe  
**Product:** Ultra 21-Inch Electric Snow Thrower  
**Model:** SJ625E  
**OEM Part Number:** ION18SB-9 (Compatible with ION series)  
**Part Name:** Handle Lock / Handle Cam Lock / Pivot Joint  
**Manual Reference:** Part #8 (Handle locks) in SJ625E Exploded View  

### Official Resources

- **Product Manual:** [SJ625E Manual (PDF)](https://files.snowjoe.com/product-manuals/SJ625EMANUAL_ENG11082017-V1.pdf)  
- **Support Phone:** 1-866-SNOWJOE (1-866-766-9563)  
- **Note:** The official hardware pack typically excludes the plastic cam lock, containing only knobs and bolts

### Download Ready-to-Print Files

**Printables.com:** [View on Printables](https://www.printables.com/) *(Link will be added after upload)*

This design is also available on Printables with photos, print settings, and community makes!

## Files

### Ready to Print (STL Files)
- `stl/male-cam-lock.stl` - Male cam lock part (ready to slice and print)
- `stl/female-cam-lock.stl` - Female cam lock part (ready to slice and print)

### Source Files (OpenSCAD)
- `male-cam-lock.scad` - Parametric source for male part
- `female-cam-lock.scad` - Parametric source for female part

**To modify the design:** Install [OpenSCAD](https://openscad.org/) (free, open-source), edit the `.scad` files, and export new STLs.  
**To just print:** Download the STL files from the `stl/` folder and import into your slicer.

## Printing Instructions

### Material
- **Recommended:** PETG, ASA, or ABS
- **NOT RECOMMENDED:** PLA (will fail in cold outdoor conditions)

### Print Settings
- **Layer Height:** 0.2mm
- **Perimeters (Walls):** Minimum 5 walls (approx 2mm thick shell)
- **Infill:** 40-100% (Gyroid pattern recommended for strength)
- **Supports:**
  - **Male Part:** None required (if printed flat with teardrop hole)
  - **Female Part:** Required for horizontal sleeve and gussets

### Orientation
- **Male Part:** Print with body flat on bed, teeth pointing up
- **Female Part:** Print with body flat on bed (largest circular face down)

### Test Print Settings (Fast & Economical)

For initial fit testing before final prints:
- **Layer Height:** 0.28-0.3mm (faster printing)
- **Walls:** 3 perimeters minimum
- **Infill:** 15-20% (Grid or Lightning pattern)
- **Top/Bottom Layers:** 3-4 layers
- **Supports:** Tree supports (uses less material)
- **Brim:** 5-8mm (helps adhesion)

**Estimated Material:** ~30-40g per part (~$1-2 total)  
**Print Time:** ~2-3 hours per part

Once test fit is confirmed, print final parts with full strength settings (5 walls, 50-100% infill).

## Where to Print (Bend, OR)

### DIYcave Makerspace
**Location:** 444 SE 9th Street, Bend, OR 97703  
**Phone:** (541) 388-2283  
**Website:** [diycave.com](https://www.diycave.com)

**Hours:**
- Thursday: 10am - 10pm
- Friday & Saturday: 8am - 8pm
- Sunday: 8am - 5pm
- Mon/Tue/Wed: CLOSED (Classes and Private Events Only)

**Available 3D Printers:**
- Creality Ender (220 x 220 x 250mm build volume)
- Prusa i3 (250 x 210 x 210mm build volume)

Both printers handle PETG, ASA, and ABS filament. Parts fit easily on either printer. Contact DIYcave for current rates and material availability.

## Assembly Notes

The two parts mesh together via their teeth (40 teeth each). A compression spring sits between them, and they're held together with a center bolt. The handle tube (22mm OD) slides into the sleeve and is secured with a retention screw.

### Hardware Requirements

| Item | Specification | Notes |
|------|---------------|-------|
| **Pivot Bolt** | M5 Carriage or Hex Bolt | Length approx 45-50mm |
| **Spring** | Compression Spring | 11mm OD / 9mm ID |
| **Handle Screw** | M5 Machine Screw | For securing sleeve to tube |
| **Handle Nut** | M5 Hex Nut | 8.1mm width, 4.5mm depth (captive) |
| **Handle Tube** | 22mm OD | Standard snowblower handle tubing |

## Design Features

### Male Part
- Reinforced center hub with spring groove
- 40 teeth with stress-relief fillets
- Rectangular sleeve for handle tube
- Screw boss with reinforcement gussets
- Side gussets for torsional strength

### Female Part
- Matching 40-tooth geometry with 2mm clearance
- 10mm deep locking pocket
- Spring retention sleeve
- Reinforced handle sleeve with cross braces
- Modular design for easy modification

## Compatibility

This design is compatible with Snow Joe ION series snowblowers that use the same handle assembly, including:
- SJ625E
- Other ION18SB models with similar handle mechanisms

## Design Credits

**Designer:** Theo Roe  
**Date:** December 2025  
**License:** Creative Commons - Attribution (CC-BY)

## Detailed Dimensions

### Male Part (Cam Lock / Tooth Hub)

| Feature | Measurement | Notes |
|---------|-------------|-------|
| Outer Diameter | 70mm | Main body |
| Body Height | 15mm | Outer rim |
| Hub Height | 18mm | Center hub matches tooth top |
| Hub OD | 18.5mm | Allows 3mm walls |
| Tooth Count | 40 | Around 63mm diameter circle |
| Tooth Length | 6mm | Radial |
| Tooth Height | 3mm | Above rim |
| Tooth Width | 1.8mm | Adjusted for 3D printing |
| Bolt Hole | 6mm | M5 bolt clearance |
| Sleeve Length | 50mm | For 22mm tube |
| Socket ID | 23mm | 1mm clearance for tube |

### Female Part (Base / Socket)

| Feature | Measurement | Notes |
|---------|-------------|-------|
| Outer Diameter | 70mm | Main body |
| Total Height | 24mm | Full part |
| Floor Height | 20mm | Solid interior |
| Tooth Count | 40 | Matching male |
| Tooth Gap | 2.5mm | 2mm teeth + 0.5mm clearance |
| Locking Box | 24mm × 31mm | With 2mm raised rim |

## Modification Tips

Both files are structured with clearly labeled sections:
- **PRIMARY DIMENSIONS** - User-adjustable measurements
- **CALCULATED DIMENSIONS** - Auto-calculated from primary values
- **MODULES** (Female part) - Reusable geometry components

To modify the design, adjust values in the PRIMARY DIMENSIONS section.

## Issues & Improvements

If you find issues or make improvements to this design, please contribute back to help others!
