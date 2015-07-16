/**
 *    calibrate_walls
 *
 *    create walls thick from 0.1mm to 2mm
 * 
 *    @author         Karel Fiala
 *    @email         fiala.karel@gmail.com
 */

module calibrate_walls() {

    cube([70,20,1]);
    for (i = [0.1:0.1:2]) {
            translate([i*20 + i*i*8,0,0]) cube([i, 20, 15]);    
    }

}


// calling
calibrate_walls();