# How to Export STL Files

Since OpenSCAD command-line export isn't working properly, follow these steps:

## Manual Export Steps

### Male Part:
1. Open OpenSCAD (located at: `C:\Program Files\OpenSCAD\openscad.exe`)
2. File → Open → Select `male-cam-lock.scad`
3. Press **F6** (or Design → Render) - This will take 1-2 minutes
4. Wait for rendering to complete (watch bottom status bar)
5. File → Export → Export as STL
6. Save as: `stl\male-cam-lock.stl`

### Female Part:
1. File → Open → Select `female-cam-lock.scad`
2. Press **F6** (or Design → Render) - This will take 1-2 minutes  
3. Wait for rendering to complete
4. File → Export → Export as STL
5. Save as: `stl\female-cam-lock.stl`

## Verify Files Created:
```powershell
Get-ChildItem stl\
```

You should see:
- `male-cam-lock.stl` (~200-500 KB)
- `female-cam-lock.stl` (~400-800 KB)

## Then Commit to Git:
```powershell
git add stl/*.stl
git add .gitignore
git add README.md
git commit -m "Add STL files for 3D printing and update documentation"
git push
```

Delete this file after export is complete.
