include <../components/keycap-models/keycap_mx_spherical.scad>;
include <../components/sweep-models/fb7958f6/model.scad>;

$fn=30;
$BASE_WIDTH=14;
$FACE_WIDTH=5;
$BASE_R=2;
$FACE_R=2;

columns = 6;
rows = 4;

design=sweep_fb7958f6(height=19, sweep_angle=[30, 45], sweep_shift=[-60, 0], slices=[columns, rows]);
for (i=[0:len(design)-1])
for (j=[0:len(design[0])-1]) {
    translate([i*19, j*-19, 0])
    keycap_mx_spherical_100u(
        face_offset=[0, 0, design[i][j][1]],
        face_angle=[design[i][j][0][1], design[i][j][0][0], 0],
        dimple_depth=0.5,
        slices=8,
        lift=0
    );
}
