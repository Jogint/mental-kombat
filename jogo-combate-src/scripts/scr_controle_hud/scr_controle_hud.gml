/// @function scr_controle_hud(_index, _cor)
/// @description Atualiza as barras de vida e energia
/// @param {Real} _index Qual instância será acessada
/// @param {Real|Constant.color} _cor A cor interna da barra
/// @param {Bool} _is_hp Se a barra for referente a vida (começa cheia)
function scr_controle_hud(_index, _cor, _is_hp){
	if (!personagem_gerenciado && array_length(global.inst_perso_partida)) {
		personagem_gerenciado = global.inst_perso_partida[_index];
	}

	if (personagem_gerenciado == noone) exit;

	var _altura_total = sprite_get_height(sprite_index) - 1;
	var _largura_total = sprite_get_width(sprite_index) - 1;
	var _porcentagem;
	
	if (_is_hp) {
		_porcentagem = personagem_gerenciado.hp_atual / personagem_gerenciado.hp_total;
	} else {
		_porcentagem = personagem_gerenciado.energia_atual / personagem_gerenciado.energia_total;
	}

	var _largura_preenchida = _largura_total * _porcentagem;
	var _y_topo = y - (_altura_total / 2);
	var _y_base = y + (_altura_total / 2);

	draw_set_color(_cor);

	var _x1, _x2;

	if (_index == 0) { // JOGADOR 1 (Esquerda -> Cresce para a Direita)
	    _x1 = x - (_largura_total / 2);
	    _x2 = _x1 + _largura_preenchida;
	
	} else { // JOGADOR 2 (Direita -> Cresce para a Esquerda)
	    _x2 = x + (_largura_total / 2);
	    _x1 = _x2 - _largura_preenchida;
	
	}

	draw_rectangle(_x1, _y_topo, _x2, _y_base, false);

	draw_self();

	scr_reset_draw();	
}