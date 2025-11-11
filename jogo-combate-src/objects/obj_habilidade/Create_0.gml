// ==================================================
/// @description Vars e Funções
// ==================================================
// ----------  ----------
alterou = false;
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
			return "Torne seu relógio mais lento e tenha mais tempo para juntar mais energia";
		case global.tipos_hab[HABS.ACELERA]:
			return "Impeça seu oponente de encher a energia! Reduza o tempo de resposta dele";
		case global.tipos_hab[HABS.ENERGETICO]:
			return "Aumente a quantidade de energia ganha por acerto durante um turno";
		default:
			return "A habilidade de tipo " + string(_hab.tipo) + " não tem uma descrição configurada.";
	}
}