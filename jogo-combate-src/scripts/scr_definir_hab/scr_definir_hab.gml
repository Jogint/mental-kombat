/// @function scr_definir_hab(nome_hab, custo_hab, tipo_hab, valor_hab, spr_hab, tempo_animacao)
/// @description Verifica se os dados da habilidade são válidos
/// @param {String} nome_hab Nome da habilidade
/// @param {Real} custo_hab Valor a ser "pago" para usar a habilidade
/// @param {String} tipo_hab A categoria da habilidade em global.tipos_hab
/// @param {Real} valor_hab O valor a ser aplicado pela habilidade
/// @param {Asset.GMSprite} spr_hab A imagem dessa habilidade
/// @param {Real} tempo_animacao Quantos segundos a animação da hab dura
/// @return {Struct}
function scr_definir_hab(nome_hab, custo_hab, tipo_hab, valor_hab, spr_hab, tempo_animacao) {
	if !is_string(nome_hab) show_error("Nome da habilidade deve ser string, obteve " + typeof(nome_hab), true);
	if !is_numeric(custo_hab) show_error("Custo da habilidade deve ser num, obteve " + typeof(custo_hab), true);
	if !array_contains(global.tipos_hab, tipo_hab) show_error("Tipo da habilidade deve estar em global.tipos_hab, obteve " + string(tipo_hab), true);
	if !is_numeric(valor_hab) show_error("Valor da habilidade deve ser num, obteve " + typeof(valor_hab), true);
	if !sprite_exists(spr_hab) show_error("Sprite da habilidade é inválido, obteve " + string(spr_hab), true);
	if !is_numeric(tempo_animacao) show_error("Tempo da animação deve ser num, obteve " + typeof(tempo_animacao), true);
	
	var _valor_habilidade;
	
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
		sprite: spr_hab,
		animacao: tempo_animacao,
	};
}