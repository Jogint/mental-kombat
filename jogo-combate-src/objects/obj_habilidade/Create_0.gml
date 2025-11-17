// ==================================================
/// @description Vars e Funções
// ==================================================
// ----------  ----------
habilidade = {} // alterado no scr_toggle_hab
alterou = false;
trocou_padrao = false;
sprite_padrao = object_get_sprite(object_index);
image_alpha = 0.5;

/// @function gera_descricao
/// @description Apresenta um pequeno texto do que a habilidade faz
/// @param {struct} _hab Qual a habilidade que precisa da descrição
/// @return {String}
function gera_descricao(_hab) {
	switch (_hab.tipo) {
		case global.tipos_hab[HABS.ATAQUE]:
			return "Use esta habilidade para causar dano ao seu oponente";
		case global.tipos_hab[HABS.CURA]:
			return "Gaste um pouco da sua energia para curar sua vida e impedir a derrota";
		case global.tipos_hab[HABS.DRENA]:
			return "Atinja seu oponente ao mesmo tempo que recebe cura equivalente ao dano";
		case global.tipos_hab[HABS.PRORROGA]:
			return "Tenha mais tempo para juntar energia enquanto atinge " + string(round(global.numeros_gerais.dano_p_mult * _hab.valor_efeito)) + " de dano";
		case global.tipos_hab[HABS.ACELERA]:
			return "Impeça seu oponente de encher a energia! Reduza o tempo de resposta dele";
		case global.tipos_hab[HABS.ENERGETICO]:
			return "Aumente a quantidade de energia ganha por acerto durante um turno";
		default:
			return "A habilidade de tipo " + string(_hab.tipo) + " não tem uma descrição configurada.";
	}
}