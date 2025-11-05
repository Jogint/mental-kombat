/// @function scr_definir_hab(_nome_hab, _custo_hab, _tipo_hab, _valor_hab, _sprite_hab)
/// @description Verifica se os dados da habilidade são válidos
/// @param {String} _nome_hab Nome da habilidade
/// @param {Real} _custo_hab Valor a ser "pago" para usar a habilidade
/// @param {String} _tipo_hab A categoria da habilidade em global.tipos_hab
/// @param {Real} _valor_hab O valor a ser aplicado pela habilidade
/// @param {Asset.GMSprite} _sprite_hab Animação da habilidade a ser usada
/// @return {Struct}
function scr_definir_hab(_nome_hab, _custo_hab, _tipo_hab, _valor_hab, _sprite_hab) {
	var _valor_habilidade;
	
	if (!is_string(_nome_hab)) show_error("Nome da habilidade deve ser string, obteve " + typeof(_nome_hab), true);
	if (!is_numeric(_custo_hab)) show_error("Custo da habilidade deve ser num, obteve " + typeof(_custo_hab), true);
	if (!array_contains(global.tipos_hab, _tipo_hab)) show_error("Tipo da habilidade deve estar em global.tipos_hab, obteve " + string(_tipo_hab), true);
	if (!is_numeric(_valor_hab)) show_error("Valor da habilidade deve ser num, obteve " + typeof(_valor_hab), true);
	if (!sprite_exists(_sprite_hab)) show_error("Sprite não foi reconhecida, obteve " + typeof(_sprite_hab), true);
	
	switch (_tipo_hab) {
		case global.tipos_hab[HABS.PRORROGA]:
		case global.tipos_hab[HABS.ACELERA]:
		case global.tipos_hab[HABS.ENERGETICO]:
			_valor_habilidade = _valor_hab;
			break;
		default:
			_valor_habilidade = round(_valor_hab);
	}
	
	return {
		nome: _nome_hab,
		custo: round(_custo_hab),
		tipo: _tipo_hab,
		valor_efeito: _valor_habilidade,
		sprite: _sprite_hab,
	};
}