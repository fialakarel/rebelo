/**
 *    spool holder v1
 * 
 *    @author    Karel Fiala
 *    @email    fiala.karel@gmail.com
 *
 *    inspired by http://www.thingiverse.com/thing:296971
 */

//$fn=50;

// parameters to change
true_width=100;
true_height=140;
thick=10;
corner_radius=10;

// other parameters
height=true_height - corner_radius;
width=true_width - corner_radius;
bottom_center_y=15;
center_x=width/2;

module cyl1() {
    cylinder(d=corner_radius, h=thick, center=true);
}

module spool_base() {
    hull() {
        translate([0,0,0]) cyl1();
        translate([center_x,height,0]) cyl1();
    }

    hull() {
        translate([0,0,0]) cyl1();
        translate([center_x,bottom_center_y,0]) cyl1();
    }

    hull() {
        translate([center_x,height,0]) cyl1();
        translate([width,0,0]) cyl1();
    }

    hull() {
        translate([width,0,0]) cyl1();
        translate([center_x,bottom_center_y,0]) cyl1();
    }

    hull() {
        translate([center_x,height,0]) cyl1();
        translate([center_x,bottom_center_y,0]) cyl1();
    }    
}

module spool_bar() {
    $fn=50;
    translate([0, 0, 2])
        cube([10, 100, 6], center=true);
    
    translate([0, 0, 5])
        rotate([0, 90, 90])
            cylinder(d=10, h=100, center=true);
    
    translate([0, 0, 9])
        rotate([0, 90, 90])
            cylinder(d=3, h=100, center=true);
}

module spool_holder() {

    difference() {
        spool_base();
        
        #translate([center_x, height, 0])
            cube([10, 10, thick], center=true);
        /*
        hull() {
        #translate([center_x, height, 0])
            cylinder(d=10, h=thick, center=true);
        #translate([center_x, height - 5, 0])
            cylinder(d=10, h=thick, center=true);
        }*/
    }
    
    translate([true_width + 5, 0, 0])
        spool_bar();
}


// calling
spool_holder();