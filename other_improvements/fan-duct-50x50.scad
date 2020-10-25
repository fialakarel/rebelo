$fn=100;

// TODO
// * make sides higher to adjust the airflow in the right direction
// * minor angle changes, increase it?

angle=27;
mount_hole_diameter=0;
shell_thickness=2*0.48;
bottom_thickness=0.75;

base_x = 50;
base_y = 60;

side_height = 8;

hole_d = 5;
fan_hole_d = 65;

difference() {
    union() {
        difference() {
            union() {
                // base
                cube([base_x,base_y,bottom_thickness]);
                
                // left side
                cube([shell_thickness,base_y,side_height]);
                
                // right side
                translate([base_x-shell_thickness,0,0])
                    cube([shell_thickness,base_y,side_height]);
                
                // right skew (completely custom)
                translate([49,24.5,0])
                    rotate([0,0,28])
                        cube([1,39.5,8]);
            };
            // HotEnd cylinder
            translate([15,63,-5])
                cylinder(d=25, h=20);
            
            // holes on sides
            translate([-20,6,(hole_d/2)+bottom_thickness])
                rotate([0,90,0])
                    cylinder(d=hole_d,h=80);
            
            // skew the right edge
            translate([49+1,24.5,-2])
                    rotate([0,0,28])
                        cube([20,39.5+5,8+2]);
        };

        difference() {
            // fan mount
            translate([0,0,0])
                rotate([-angle,0,0])
                    cube([base_x, shell_thickness, side_height]);
            
            // left hole
            translate([0,0,-0.25])
                //rotate([-angle,0,0])
                    translate([2+2.5,10,1+2.5])
                        mirror([0,90,90])
                            cylinder(d=hole_d,h=20);
            // right hole
            translate([0,0,-0.25])
                //rotate([-angle,0,0])
                    translate([41,0,0])
                        translate([2+2.5,10,1+2.5])
                            mirror([0,90,90])
                                cylinder(d=hole_d,h=20);
            
            // cut under to clean it
            translate([-base_x,-base_y,-1])
                cube([3*base_x,3*base_y,1]);
        }
    }
    
    // cut the angle to perfect it
    translate([-5,-19,6.7])
        rotate([-angle,0,0])
            cube([50+10,20,20]);
    
    // cut the top to perfect it
    translate([-10,-10,7])
        cube([100,100,20]);
    
    // cut the mount to perfect it
    translate([base_x/2,0,bottom_thickness + fan_hole_d/2])
        rotate([90,0,0])
            cylinder(d=fan_hole_d, h=20, center=true);
}