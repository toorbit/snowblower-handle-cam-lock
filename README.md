# Snow Joe SJ625E Handle Cam Lock Replacement

**3D printable replacement parts for the Snow Joe SJ625E snowblower handle pivot joint.**

![License: CC-BY](https://img.shields.io/badge/License-CC--BY-blue.svg) ![OpenSCAD](https://img.shields.io/badge/Made%20with-OpenSCAD-yellow.svg)

## 📥 Quick Start

**Just want to print?** Download the STL files from the [`stl/`](stl/) folder and load them into your slicer.

**On Printables:** [View on Printables.com](https://www.printables.com/) *(Link coming soon)*

---

## 📋 Table of Contents

- [Overview](#overview)
- [What You Need](#what-you-need)
- [Printing Guide](#printing-guide)
- [Assembly](#assembly)
- [Files Included](#files-included)
- [For Makers in Bend, OR](#for-makers-in-bend-or)
- [Customization](#customization)
- [Technical Specifications](#technical-specifications)
- [License & Credits](#license--credits)

---

## 🔍 Overview

This is a complete replacement for the broken handle cam lock (pivot joint) on the Snow Joe SJ625E electric snowblower. The original plastic part often fails, and Snow Joe's hardware kits typically don't include it.

**⚠️ Why This Design Exists:** According to forum reports, Snow Joe support has informed customers that this part is out of stock with no restocking planned, making it effectively discontinued. This 3D-printable replacement offers a permanent solution.

**Compatible Models:**
- Snow Joe SJ625E
- ION18SB series with similar handle assemblies

**OEM Part Reference:** ION18SB-9 (Part #8 in manual)  
**Official Manual:** [SJ625E Manual PDF](https://files.snowjoe.com/product-manuals/SJ625EMANUAL_ENG11082017-V1.pdf)  
**Support:** 1-866-SNOWJOE (1-866-766-9563)

---

## 🛠️ What You Need

### Parts to Print
- 1× Male cam lock (the rotating clamp)
- 1× Female cam lock (the fixed base)
- 1× Cam lever (the blue quick-release locking handle) - *Design coming soon*

**Note:** The cam lever design is not yet included but is planned for future release. It's the blue plastic lever that pivots on the bolt and locks the handle position via a camming action.

### Hardware (Not Included)
| Item | Specification | Where to Get |
|------|---------------|--------------|
| Pivot Bolt | M5 × 45-50mm with cross-hole in head | Hardware store (specialized) |
| Metal Pin | For cam lever attachment to bolt | Hardware store or Amazon |
| Compression Spring | 11mm OD / 9mm ID | Hardware store or Amazon |
| Handle Screw | M5 machine screw | Hardware store |
| Hex Nut | M5 hex nut (8.1mm width) | Hardware store |
| Washer | M5 washer (for pivot bolt) | Hardware store |
| Handle Tubes | 22mm OD tubing (upper & lower) | Original snowblower parts |

**Note:** The pivot bolt requires a horizontal cross-hole drilled through the head to accept the pin that connects the cam lever.

### Filament
- **Required:** PETG, ASA, or ABS (outdoor/cold rated)
- **DO NOT USE PLA** - will crack in freezing temperatures
- **Amount:** \~80-120g per part at full strength

---

## 🖨️ Printing Guide

### Orientation
- **Male Part:** Flat on bed, teeth pointing up
- **Female Part:** Flat on bed, largest circular face down

### Final Print Settings (Strong & Durable)

Use these settings for parts that will last:

| Setting | Value | Notes |
|---------|-------|-------|
| **Material** | PETG, ASA, or ABS | Must be cold-resistant |
| **Layer Height** | 0.2mm | Good balance |
| **Walls** | 5 perimeters | ~2mm thick shell |
| **Infill** | 50-100% | Gyroid pattern recommended |
| **Top/Bottom** | 5 layers | Solid surfaces |
| **Supports** | Male: None / Female: Yes | Tree supports for female |
| **Brim** | 5-8mm | Prevents warping |

**Print Time:** \~4-6 hours per part  
**Material:** \~80-120g per part (\~$4-6 total)

### Test Print Settings (Fast & Cheap)

For initial fit-testing only:

| Setting | Value | Notes |
|---------|-------|-------|
| **Layer Height** | 0.28-0.3mm | Faster |
| **Walls** | 3 perimeters | Minimum |
| **Infill** | 15-20% | Grid or Lightning |
| **Supports** | Tree supports | Uses less material |

**Print Time:** \~2-3 hours per part  
**Material:** \~30-40g per part (\~$1-2 total)

⚠️ **Test prints are for fit-checking only!** Once confirmed, print with final settings above.

---

## 🔧 Assembly

1. **Insert spring** into the groove on the male part's center hub
2. **Align teeth** - mesh the 40 teeth of both parts together
3. **Insert pivot bolt** through the center holes
4. **Slide handle tube** (22mm OD) into the sleeve
5. **Secure tube** with M5 screw and hex nut through screw boss
6. **Test rotation** - parts should lock in multiple positions

---

## 📦 Files Included

### STL Files (Ready to Print)
- [`stl/male-cam-lock.stl`](stl/male-cam-lock.stl) - Male rotating clamp
- [`stl/female-cam-lock.stl`](stl/female-cam-lock.stl) - Female fixed base

### Source Files (For Customization)
- `male-cam-lock.scad` - OpenSCAD parametric source
- `female-cam-lock.scad` - OpenSCAD parametric source

**Want to modify?** Install [OpenSCAD](https://openscad.org/) (free), edit the `.scad` files, and re-export.

---

## 📍 For Makers in Bend, OR

### DIYcave Makerspace
Print these parts locally at DIYcave!

- **Address:** 444 SE 9th Street, Bend, OR 97703
- **Phone:** (541) 388-2283
- **Web:** [diycave.com](https://www.diycave.com) | [Tool List](https://www.diycave.com/toollist)

**Hours:**
- Thu: 10am-10pm | Fri-Sat: 8am-8pm | Sun: 8am-5pm
- Mon-Wed: CLOSED (Private events only)

**3D Printers Available:**
- Creality Ender (220×220×250mm)
- Prusa i3 (250×210×210mm)

Both handle PETG/ASA/ABS. Your parts fit easily. Call ahead for rates and filament availability!

---

## 🎨 Customization

Both SCAD files are organized for easy modification:

```
// PRIMARY DIMENSIONS - Adjust these to customize
Body_OD = 70;           // Main body diameter
Tooth_Count = 40;       // Number of locking positions
Sleeve_Length = 50;     // Handle tube socket length

// CALCULATED DIMENSIONS - Auto-computed (don't edit)
// MODULES (female part) - Reusable geometry
```

**To customize:**
1. Open `.scad` file in OpenSCAD
2. Modify values in `PRIMARY DIMENSIONS` section
3. Press F5 to preview, F6 to render
4. Export as STL

---

## 📐 Technical Specifications

<details>
<summary><b>Click to expand detailed dimensions</b></summary>

### Male Part (Cam Lock / Tooth Hub)

| Feature | Measurement | Notes |
|---------|-------------|-------|
| Outer Diameter | 70mm | Main body |
| Body Height | 15mm | Outer rim |
| Hub Height | 18mm | Center hub |
| Tooth Count | 40 | Locking positions |
| Tooth Length | 6mm | Radial |
| Tooth Height | 3mm | Above rim |
| Tooth Width | 1.8mm | 3D print adjusted |
| Bolt Hole | 6mm | M5 clearance |
| Sleeve Length | 50mm | For 22mm tube |
| Socket ID | 23mm | 1mm tube clearance |

### Female Part (Base / Socket)

| Feature | Measurement | Notes |
|---------|-------------|-------|
| Outer Diameter | 70mm | Main body |
| Total Height | 24mm | Full part |
| Floor Height | 20mm | Solid interior |
| Tooth Count | 40 | Matches male |
| Tooth Gap | 2.5mm | 2mm teeth + 0.5mm clearance |
| Locking Box | 24×31mm | 2mm raised rim |

</details>

### Design Features

**Male Part:**
- Reinforced center hub with spring groove
- 40 teeth with stress-relief fillets for durability
- Rectangular sleeve for 22mm handle tube
- Screw boss with reinforcement gussets
- Side gussets for torsional strength

**Female Part:**
- 40 matching tooth slots with clearance
- 10mm deep locking pocket mechanism
- Spring retention sleeve
- Reinforced handle sleeve with cross braces
- Modular parametric design

---

## 📜 License & Credits

**Designer:** Theo Roe  
**Created:** December 2025  
**License:** [Creative Commons - Attribution (CC-BY)](https://creativecommons.org/licenses/by/4.0/)

Feel free to remix, modify, and share! Attribution appreciated.

---

## 🤝 Contributing

Found an issue or made an improvement? Contributions welcome!

- **Issues:** [GitHub Issues](https://github.com/toorbit/snowblower-handle-cam-lock/issues)
- **Improvements:** Submit a pull request or share your remix!
- **Printed successfully?** Share your make on Printables!

---

**Made with ❄️ for fellow snowblower owners**
