top_path =      "./plate_and_case/dxf/top.dxf";
top_thick =     2;

closed_path =   "./plate_and_case/dxf/closed.dxf";
closed_thick =  2;

plate_path =    "./plate_and_case/dxf/plate.dxf";
plate_thick =   5;

open_path =     "./plate_and_case/dxf/open.dxf";
open_thick =    9;

bottom_path =   "./plate_and_case/dxf/bottom.dxf";
bottom_thick =  2;

module gen(path, thick){
  translate([0,0,-thick]) linear_extrude(height=thick) import(path);
};

translate([0,0,0])
gen(top_path, top_thick);

translate([0,0,-top_thick])
gen(closed_path, closed_thick);

translate([0,0,(-top_thick - closed_thick)])
gen(plate_path, plate_thick);

translate([0,0,(-top_thick - closed_thick - plate_thick)])
gen(open_path, open_thick);

!translate([0,0,(-top_thick - closed_thick - plate_thick - open_thick)])
gen(bottom_path, bottom_thick);
