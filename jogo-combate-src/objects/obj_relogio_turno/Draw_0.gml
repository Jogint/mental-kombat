draw_self();

draw_set_color(c_black);

var _tempo_restante = string(round(global.timer_turno / game_get_speed(gamespeed_fps)));

if (_tempo_restante < 0) {
	scr_reset_draw();
	exit;
}

if (_tempo_restante < 10) draw_set_color(c_red); 

var _largura = string_width(_tempo_restante);
var _altura = string_height(_tempo_restante);
	
draw_text(x - _largura / 2, y - _altura / 2, _tempo_restante);

scr_reset_draw();