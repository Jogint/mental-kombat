/// @function scr_definir_hab(nome_hab, custo_hab, tipo_hab, valor_hab, spr_hab, tempo_animacao)
/// @description Verifica se os dados da habilidade são válidos
/// @param {String} nome_hab Nome da habilidade
/// @param {Real} custo_hab Valor a ser "pago" para usar a habilidade
/// @param {String} tipo_hab A categoria da habilidade em global.tipos_hab
/// @param {Real} valor_hab O valor a ser aplicado pela habilidade
/// @param {Real} tempo_animacao Quantos segundos a animação da hab dura
/// @return {Struct}
function scr_definir_hab(nome_hab, custo_hab, tipo_hab, valor_hab, tempo_animacao) {
	var _valor_habilidade;
	var _sprite_hab = atribui_sprite_hab(tipo_hab);
	
	if (!is_string(nome_hab)) show_error("Nome da habilidade deve ser string, obteve " + typeof(nome_hab), true);
	if (!is_numeric(custo_hab)) show_error("Custo da habilidade deve ser num, obteve " + typeof(custo_hab), true);
	if (!array_contains(global.tipos_hab, tipo_hab)) show_error("Tipo da habilidade deve estar em global.tipos_hab, obteve " + string(tipo_hab), true);
	if (!is_numeric(valor_hab)) show_error("Valor da habilidade deve ser num, obteve " + typeof(valor_hab), true);
	if (!is_numeric(tempo_animacao)) show_error("Tempo da animação deve ser num, obteve " + typeof(tempo_animacao), true);
	if (!sprite_exists(_sprite_hab)) show_error("Não foi encontrada uma sprite que represente a habilidade tipo " + string(tipo_hab), true);
	
	switch (tipo_hab) {
		case global.tipos_hab[4]:
		case global.tipos_hab[5]:
		case global.tipos_hab[6]:
			_valor_habilidade = valor_hab;
			break;
		default:
			_valor_habilidade = round(valor_hab);
	}
	
	return {
		nome: nome_hab,
		custo: round(custo_hab),
		tipo: tipo_hab,
		valor_efeito: _valor_habilidade, 
		sprite: _sprite_hab,
		animacao: tempo_animacao,
	};
}

/// @function atribui_sprite_hab(tipo)
/// @description Acessa a sprite da categoria da habilidade
/// @param {String} tipo A categoria da habilidade em global.tipos_hab
/// @return {Asset.GMSprite}
function atribui_sprite_hab(tipo) {
	switch (tipo) {
		case global.tipos_hab[0]: // pular
			return spr_teste_opcao;
		case global.tipos_hab[1]: // dano
			return spr_hab_dano;
		case global.tipos_hab[2]: // cura
			return spr_hab_cura;
		case global.tipos_hab[3]: // dreno
			return spr_hab_dreno;
		case global.tipos_hab[4]: // prorroga
			return spr_hab_prorroga;
		case global.tipos_hab[5]: // acelera
			return spr_hab_acelera;
		case global.tipos_hab[6]: // energetico
			return spr_hab_energetico;
	}
}