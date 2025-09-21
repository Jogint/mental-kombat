/// Chamado em obj_opcao_perso
// TODO: Se for ter multplayer, tem que mudar esse if
function scr_selecionou_perso(obj){
	if (array_length(global.perso_atuais) == global.qtd_players_partida) {
		array_pop(global.perso_atuais);
	}
	array_push(global.perso_atuais, obj);
}