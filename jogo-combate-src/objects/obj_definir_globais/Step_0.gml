/// @description Ativar modo rápido
var _qtd_modos_jogo = 3;

if (array_length(global.perso_disponiveis) == array_length(global.todos_perso) &&
array_length(global.modos_jogo) != _qtd_modos_jogo) {
	global.modos_jogo = ["2 jogadores", "história", "rápido"];
}