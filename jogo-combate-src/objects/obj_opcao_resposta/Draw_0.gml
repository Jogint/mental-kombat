draw_self();

if (global.jogador_atual != "") {
	
	var _raio = 32;
	if (global.jogador_atual != global.tipos_jogadores[JOGADOR.BOT] &&
		mouse_check_button(mb_left) &&
		position_meeting(mouse_x, mouse_y, id)) {
		draw_set_color(c_red);
		draw_circle(x, y, _raio, false);
	}
	
	draw_set_color(c_black);
	draw_set_font(fnt_principal);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	var _x = x;
	var _y = y;
	
	var _texto = string(numero);

	if (_texto < 0) {
		scr_reset_draw();
		exit;
	}

	draw_text(_x, _y, _texto);
	
	scr_reset_draw();

	draw_set_color(c_white);
}
