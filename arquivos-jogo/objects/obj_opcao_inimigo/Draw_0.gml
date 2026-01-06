draw_self();
draw_set_font(fnt_destaque);
draw_set_halign(fa_left);

draw_set_colour(bloqueado ? c_ltgray : c_black);

var _espaco = 25;
var _quebra = 50;
var _x = nome == global.nomes_perso[4] ? x + 44 : x + 64;
draw_text_ext(_x, y - 31, nome, _espaco, _quebra);

scr_reset_draw();