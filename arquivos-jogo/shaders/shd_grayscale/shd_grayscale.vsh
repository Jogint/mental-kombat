// shd_grayscale.vertex
attribute vec3 in_position;
attribute vec4 in_colour;
attribute vec2 in_texcoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_position, 1.0);
    v_vColour = in_colour;
    v_vTexcoord = in_texcoord;
}