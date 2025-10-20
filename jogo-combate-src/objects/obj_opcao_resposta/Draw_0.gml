draw_self();

if (global.jogador_atual != "") {
	draw_set_color(c_white);
	
	var _raio = 32;
	
	if (global.jogador_atual != global.tipos_jogadores[0] &&
	mouse_check_button(mb_left) &&
	position_meeting(mouse_x, mouse_y, id)) {
		draw_set_color(c_red);
		draw_circle(x + _raio - 1, y + _raio - 1, _raio, false);
	}
	
	draw_set_color(c_black);
	
	var _texto = string(numero);
	var _largura = string_width(_texto);
	var _altura = string_height(_texto);
	
	draw_text(x + _raio - _largura / 2, y + _raio - _altura / 2, _texto);
}
