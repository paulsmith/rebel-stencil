/*  rebel_stencil.scad
 *
 *  3D print spray paint stencil of the Rebel Alliance logo
 *  ———
 *  HOW TO USE
 *    • Put rebel_alliance_logo.svg in the same directory.
 *    • Tweak the parameters below as desired.
 *    • F5 to preview, F6 to CGAL render, then "File -> Export -> STL".
 *    • Slice at ~0.2 mm layer height.
 */

inch = 25.4;

////////////////////////
//  USER PARAMETERS  //
////////////////////////
logo_diameter        = 8.5 * inch;  // diameter of the logo in inches
plate_width_height   = 9.0 * inch;  // width and height of the plate in inches
thickness            = 2.0;         // plate thickness in mm
logo_nominal_size    = 300;

////////////////////////
//  DERIVED VALUES    //
////////////////////////
logo_scale = logo_diameter / logo_nominal_size;

////////////////////////
//  MODULES           //
////////////////////////
module stencil_plate()
{
    cube([plate_width_height, plate_width_height, thickness], center = true);
}

module rebel_cutout()
{
    translate([0,0,-1])
        linear_extrude(height = thickness*2)
            scale(logo_scale)
                import("rebel_alliance_logo.svg", center=true, dpi=inch);
}

////////////////////////
//  MAIN              //
////////////////////////
difference()
{
    stencil_plate();
    rebel_cutout();
}
