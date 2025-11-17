// ==================================================
/// @description Exibe o tempo
// ==================================================

draw_self();
draw_set_color(c_black);
draw_set_font(fnt_principal);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
var _tempo_restante = string(round(obj_gestao_rodada.timer_turno / game_get_speed(gamespeed_fps)));
if (_tempo_restante < 0) _tempo_restante = 0;

if (_tempo_restante < 10) {
	draw_set_colour(c_red);
}

draw_text(x, y, _tempo_restante);
	
scr_reset_draw();
