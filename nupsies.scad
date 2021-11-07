$fn=20;

module fannupsie(){
    union(){
        translate([ 0.85,0,0]) cylinder(d=1.7,h=7.3);
        translate([14.15,0,0]) cylinder(d=1.7,h=7.3);
        translate([ 0.85,3,0]) cylinder(d=1.7,h=7.3);
        translate([14.15,3,0]) cylinder(d=1.7,h=7.3);
        translate([ 1.7 ,0,8.15]) rotate([0,90,0]) cylinder(d=1.7,h=11.6);
        translate([ 1.7 ,3,8.15]) rotate([0,90,0]) cylinder(d=1.7,h=11.6);
        translate([ 1.7 ,0,7.3]) rotate([90,270,0]) rotate_extrude(angle=90) translate([0.85,0,0]) circle(d=1.7);
        translate([ 1.7 ,3,7.3]) rotate([90,270,0]) rotate_extrude(angle=90) translate([0.85,0,0]) circle(d=1.7);
        translate([ 13.3,0,7.3]) rotate([90,  0,0]) rotate_extrude(angle=90) translate([0.85,0,0]) circle(d=1.7);
        translate([ 13.3,3,7.3]) rotate([90,  0,0]) rotate_extrude(angle=90) translate([0.85,0,0]) circle(d=1.7);
        difference(){
            union(){
                difference(){
                    cube([15,3,9]);
                    translate([0,0,7.3]) cube([1.7,3,1.7]);
                    translate([13.3,0,7.3]) cube([1.7,3,1.7]);
                }
                translate([ 1.7,0,7.3]) rotate([-90,0,0]) cylinder(d=3.4,h=3);
                translate([13.3,0,7.3]) rotate([-90,0,0]) cylinder(d=3.4,h=3);
            }
            translate([1,1,0]) cube([13,1,8]);
            translate([4.125,0,2.7]) cube([6.5,1,3]);
            translate([7.5,3,4.5]) rotate([90,0,0]) cylinder(d=2,h=1);

        }
    }
}

module psunupsie(){
    xc = 18.3;
    yc = 4;
    zc = 20.5;
    rc = 1.2;
    wd = 1.5;
    xd = 8;
    zd = 4;
    rd = 0.8;
    dz = 3.5;   // Höhe d Loches über ref plane
    dr = 0.8;
    rr = 8;
    difference(){
        union(){
            difference(){
                cube([xc, yc, zc]);
                translate([    0,yc-rc,    0]) cube([rc, rc, zc]);
                translate([xc-rc,yc-rc,    0]) cube([rc, rc, zc]);
                translate([    0,    0,    0]) cube([rc, rc, zc]);
                translate([xc-rc,    0,    0]) cube([rc, rc, zc]);
                translate([    0,    0,zc-rc]) cube([xc, rc, rc]);
                translate([    0,yc-rc,zc-rc]) cube([xc, rc, rc]);
                translate([    0,    0,zc-rc]) cube([rc, yc, rc]);
                translate([xc-rc,    0,zc-rc]) cube([rc, yc, rc]);
                
                translate([(xc-xd)/2, 0, dz]) cube([xd, wd, zd]);
                translate([(xc-xd)/2, 0, dz]) translate([-rd, 0, -rd]) cube([xd+2*rd, rd, zd+2*rd]);
            }
            translate([   rc,yc-rc,    0]) cylinder(r=rc, h=zc-rc);
            translate([xc-rc,yc-rc,    0]) cylinder(r=rc, h=zc-rc);
            translate([   rc,   rc,    0]) cylinder(r=rc, h=zc-rc);
            translate([xc-rc,   rc,    0]) cylinder(r=rc, h=zc-rc);
            translate([   rc,   rc,zc-rc]) rotate([0,90,0])  cylinder(r=rc, h=xc-2*rc);
            translate([   rc,yc-rc,zc-rc]) rotate([0,90,0])  cylinder(r=rc, h=xc-2*rc);
            translate([   rc,   rc,zc-rc]) rotate([-90,0,0]) cylinder(r=rc, h=yc-2*rc);
            translate([xc-rc,   rc,zc-rc]) rotate([-90,0,0]) cylinder(r=rc, h=yc-2*rc);
            translate([   rc,   rc,zc-rc]) sphere(r=rc);
            translate([   rc,yc-rc,zc-rc]) sphere(r=rc);
            translate([xc-rc,   rc,zc-rc]) sphere(r=rc);
            translate([xc-rc,yc-rc,zc-rc]) sphere(r=rc);
            
            translate([(xc-xd)/2-rd, rd, dz-rd]) cylinder(r=rd, h=zd+2*rd);
            translate([(xc+xd)/2+rd, rd, dz-rd]) cylinder(r=rd, h=zd+2*rd);
            translate([(xc-xd)/2-rd, rd, dz-rd]) rotate([0,90,0]) cylinder(r=rd, h=xd+2*rd);
            translate([(xc-xd)/2-rd, rd, dz+rd+zd]) rotate([0,90,0]) cylinder(r=rd, h=xd+2*rd);
                
            for(i = [0, 5, 10]){
                translate([xc/2, yc, i]) rotate([90,-45,0]) rotate_extrude(angle=90, $fn=60) translate([rr,0,0]) circle(d=dr);
            }
        }
        translate([wd, wd, 0]) cube([xc-2*wd, yc-2*wd, zc-wd]);
    }
}

//fannupsie();
psunupsie();
