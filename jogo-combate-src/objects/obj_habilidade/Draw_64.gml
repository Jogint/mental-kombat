if (global.modo_jogo_atual != global.modos_jogo[MODO.RAPIDO]) {
	draw_set_color(c_black);
	draw_set_font(fnt_principal);
	
	var _x = x + 5 + (sprite_get_width(spr_hab_acelera) / 2); // toda habilidade tem o msm tamanho então...
	var _y = y + 90;
	var _espacamento_linhas = 30;
	var _margem_x = 10;
	var _fundo_largura = 300 - (_margem_x * 2); // tamanho do obj_fundo_hab em scr_toggle_hab
	
	var _textos = [
		string(habilidade.nome), 
		"Custo: " + string(habilidade.custo), 
		string(habilidade.tipo) + ": " + string(habilidade.valor_efeito),
		gera_descricao(habilidade),
	];
	
	for (var _i = 0; _i < array_length(_textos); _i++) {
		if (_i) {
			_y += _espacamento_linhas;
		}
		
		draw_set_halign(fa_center);
			
		if (_i == array_length(_textos) - 1) {_y += _espacamento_linhas};
		
		draw_text_ext(_x, _y, _textos[_i], _espacamento_linhas, _fundo_largura - _margem_x);
	}
	
	scr_reset_draw();
}