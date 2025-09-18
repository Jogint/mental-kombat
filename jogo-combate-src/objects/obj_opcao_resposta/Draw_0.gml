// Change the drawing color to black so it's visible on the white square.
draw_self();
draw_set_color(c_black);
var _fontsize = 9;

// Draw the number.
var _largura_sprite = sprite_get_width(sprite_index);
draw_text(x + _largura_sprite/2 - _fontsize + 3, y + _largura_sprite/2 - _fontsize, string(numero));