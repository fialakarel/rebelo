$fn=100;

module old_mount() {
    rotate([0,0,180])
        import("/home/kfiala/temp/Fan_mount_V8b.stl");
};

module bottom_part() {
    difference() {
        // base
        //cube([40, 40, 2]);
        hull() {
            translate([1,1,0])
                cylinder(d=2,h=2);
            translate([40-1,1,0])
                cylinder(d=2,h=2);
            translate([40-1,40-1,0])
                cylinder(d=2,h=2);
            translate([1,40-1,0])
                cylinder(d=2,h=2);
        }
        
        // inner circle -- not needed anymore
        //translate([20,20,-5])
            //cylinder(d=38-5-5,h=2*10);
        
        // holes
        translate([3/2+2,3/2+2,-5])
            cylinder(d=4,h=2*10);
        translate([40-3/2-2,3/2+2,-5])
            cylinder(d=4,h=2*10);
        translate([40-3/2-2,40-3/2-2,-5])
            cylinder(d=4,h=2*10);
        translate([3/2+2,40-3/2-2,-5])
            cylinder(d=4,h=2*10);
        
        // mount line -- stupid idea in this area, need to be reworked
        //translate([(40-25)/2,1.5,-5])
            //cube([25, 2, 10]);
    }    
}

module middle_part() {
    hull() {
        difference() {
            translate([20,20-2.5,0])
                cylinder(d=40-5,h=1);
            // inner circle
            translate([20,20-2.5,-5])
                cylinder(d=38-5,h=50);
            //translate([0,40-5,-5])
//                cube([40,20,100]);
        }

        translate([(40-26)/2,0,35+2])
            cube([26,26,1]);
    }
}

module base() {
    translate([0,-5, 0])
        bottom_part();
    middle_part();
    //translate([(26+40)/2,26,40])
        //old_mount();
}


difference() {
    base();
    translate([2.05,1.1,-0.1])
        scale([0.89,0.89,1.1])
            middle_part();
    // inner circle
    //rotate([7,0,0])
        //translate([20,20-2.5,-10])
          //cylinder(d1=38-5,d2=22,h=40+3+10);
}

/*
// helper to get it in line
#translate([0,-1,0])
    cube([40,1,60]);
*/

/*
// helper to get the measures
#translate([0,35,0])
    cube([40,1,60]);
*/
