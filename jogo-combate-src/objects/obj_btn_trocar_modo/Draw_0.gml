// ==================================================
/// @description Desenha texto do botão
// ==================================================

draw_self();
draw_set_color(c_black);
draw_set_font(fnt_principal);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
var _x = x;
var _y = y;
	
var _texto = string(global.modo_jogo_atual);

draw_text(_x, _y, _texto);
	
scr_reset_draw();
