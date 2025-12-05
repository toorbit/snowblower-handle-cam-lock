# Snow Joe Handle Cam Lock Replacement

3D printable replacement parts for the Snow Joe SJ625E handle cam lock mechanism.

## Part Information

**Product:** Snow Joe Ultra 21-Inch Electric Snow Thrower  
**Model:** SJ625E  
**OEM Part Number:** ION18SB-9  
**Manual Reference:** Part #8 in SJ625E owner's manual

## Files

- `male-cam-lock.scad` - Male cam lock part with teeth (the rotating handle clamp)
- `female-cam-lock.scad` - Female cam lock part with tooth receivers (the fixed base)

## Printing Instructions

### Material
- **Recommended:** PETG, ASA, or ABS
- **NOT RECOMMENDED:** PLA (will fail in cold outdoor conditions)

### Print Settings
- **Layer Height:** 0.2mm
- **Perimeters:** 4-5 walls
- **Infill:** 50-100%
- **Supports:** Yes (for sleeve and boss areas)

### Orientation
- **Male Part:** Print with body flat on bed, teeth pointing up
- **Female Part:** Print with body flat on bed

## Assembly Notes

The two parts mesh together via their teeth (40 teeth each). A compression spring sits between them, and they're held together with a center bolt. The handle tube slides into the sleeve and is secured with a set screw.

**Spring Specifications:**
- Outer Diameter: 12mm
- Inner Diameter: 9mm
- Wire Gauge: ~1.5mm
- Total Height: 24mm (12mm per half when compressed)

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

## Dimensions Summary

| Feature | Male Part | Female Part |
|---------|-----------|-------------|
| Body Height | 15mm | 24mm |
| Body Diameter | 70mm | 70mm |
| Hub Height | 18mm | - |
| Teeth Count | 40 | 40 |
| Tooth Width | 2.0mm | 2.5mm (gap) |
| Tooth Height | 3mm | 5mm |
| Sleeve Length | 50mm | 50mm |

## Modification Tips

Both files are structured with clearly labeled sections:
- **PRIMARY DIMENSIONS** - User-adjustable measurements
- **CALCULATED DIMENSIONS** - Auto-calculated from primary values
- **MODULES** (Female part) - Reusable geometry components

To modify the design, adjust values in the PRIMARY DIMENSIONS section.

## Issues & Improvements

If you find issues or make improvements to this design, please contribute back to help others!
