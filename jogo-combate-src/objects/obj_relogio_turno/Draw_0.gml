/// @description Inserir texto
draw_self();
draw_set_color(c_black);
draw_set_font(fnt_principal);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
var _x = x;
var _y = y;
	
var _tempo_restante = string(round(global.timer_turno / game_get_speed(gamespeed_fps)));

if (_tempo_restante < 0) {
	scr_reset_draw();
	exit;
}

draw_text(_x, _y, _tempo_restante);
	
scr_reset_draw();
