if (room == rm_selecao_personagem) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_destaque);

	var _y = y + 170;
	var _espaco = 25;
	var _quebra = 200;
	var _texto;

	// ----------- Se não tem sprite ainda -----------
	if (sprite_index == -1) {
	
		draw_set_colour(c_maroon);
	
		// ----------- Mostra se é sua vez de selecionar ou não -----------
		if (global.perso_atuais[0] || id == inst_perso_selecionado_p1) {
			_texto = "Selecione um personagem";
		} else {
			_texto = "Aguardado seleção de jogador um";
		}
	
		draw_text_ext(x, _y, _texto, _espaco, _quebra);

	// ----------- Se já tem uma sprite -----------
	} else {
		draw_self();
	
		draw_set_colour(c_green);
	
		// ----------- Apresenta confirmação -----------
	
		if (id == inst_perso_selecionado_p1) {
			if (global.perso_atuais[0]) {
				draw_text(x, _y, "Selecionado!")
			}
		} else {
			if (global.perso_atuais[1]) {
				draw_text(x, _y, "Selecionado!")
			}
		}
	}

	scr_reset_draw();
} else {
	draw_self();
}