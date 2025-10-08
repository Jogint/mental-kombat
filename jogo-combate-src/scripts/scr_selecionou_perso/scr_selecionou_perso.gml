/// Chamado no obj_btn_avancar em rm_selecao
function scr_selecionou_perso(obj){
	if (array_length(global.perso_atuais) == global.qtd_players_partida) {
		array_pop(global.perso_atuais);
	}
	array_push(global.perso_atuais, obj);
	global.ultimo_selecionado = "";
}