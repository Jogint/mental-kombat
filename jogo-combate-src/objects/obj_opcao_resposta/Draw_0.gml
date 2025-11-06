draw_self();

if (global.jogador_atual != "") {
	draw_set_font(fnt_principal);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	opcao_selecionada();
	
	if (desenhar_circulo || tempo_feedback_bot > 0) {
	    var _raio = 32;
	    draw_set_color(c_red);
	    draw_circle(x, y, _raio, false);
	}
	
	draw_set_color(c_black);
	
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

/// @function opcao_selecionada(_exibe_bot = false)
/// @description Ativa o desenho do círculo de feedback e o timer (se for do bot).
/// @param {boolean} _exibe_bot Se o usuário acertou (feedback do jogo) ou se é seleção do jogador.
function opcao_selecionada(_exibe_bot = false) {
    var _is_bot = (global.jogador_atual == global.tipos_jogadores[JOGADOR.BOT]);
    
    // Feedback do Jogador (Mouse)
    if (!_is_bot && mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
        desenhar_circulo = true;
        return;
    } else {desenhar_circulo = false;}
    
    // Feedback do Bot/Jogo (_exibe_bot = true)
    if (_exibe_bot) {
        desenhar_circulo = true;
        tempo_feedback_bot = game_get_speed(gamespeed_fps); 
    }
}