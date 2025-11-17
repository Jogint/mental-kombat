// ==================================================
/// @description Insere número e clique
// ==================================================

draw_self();

// ---------- Se houver um player atual, executa ----------
if (obj_gestao_rodada.jogador_atual != noone) {
	draw_set_font(fnt_principal);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	// ---------- Desenha círculo confirmando seleção ----------
	if (desenhar_circulo || tempo_feedback_bot > 0) {
	    var _raio = 32;
	    draw_set_color(c_red);
	    draw_circle(x, y, _raio, false);
	}
	
	// ---------- Desenha o texto ----------
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
}