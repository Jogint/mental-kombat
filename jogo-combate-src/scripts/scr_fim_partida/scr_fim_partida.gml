/// Chamada em obj_controle_rodada ao clicar alguma tecla pre-determinada
/// @param onde: índice da room que será exibida
function scr_fim_partida(onde){
	if (global.quem_venceu == global.tipos_jogadores[1]) {
		desbloqueou_trilha();
	}
	resetar_globais(onde == 0);
	room_goto(onde);
}

function desbloqueou_trilha () {
	show_debug_message("entrou");
	if (global.modo_jogo_atual == global.modos_jogo[1]) {
		show_debug_message("p1 venceu");
		if (!array_contains(global.perso_disponiveis, global.perso_atuais[1])) {
			array_push(global.perso_disponiveis, global.perso_atuais[1]);
			show_debug_message("player ganha: " + string(global.perso_atuais[1]));
		}
		var _prox = array_get_index(global.todos_perso, global.perso_atuais[1]) + 1;
		if (_prox < array_length(global.todos_perso)) {
			if (!array_contains(global.inimigos_disponiveis, global.todos_perso[_prox])) {
				array_push(global.inimigos_disponiveis, global.todos_perso[_prox]);
				show_debug_message("novo inimigo: " + string(global.todos_perso[_prox]));
			}
		}
	}
}

function resetar_globais(resetar_pontuacao) {
	global.jogador_atual = "";
	global.perso_atuais = [noone, noone];
	global.inst_perso_partida = [];
	global.perguntas_geradas = scr_gerar_perguntas();
	global.pergunta_atual = global.perguntas_geradas[0];
	global.partida_acabou = true;
	global.timer_turno = 0;
	global.turno_iniciou = false;
	global.errou_resposta = false;
	global.exibir_hab = false;
	global.hab_visiveis = [];
	global.ultimo_selecionado = "";
	global.quem_venceu = "noone";
	if (resetar_pontuacao) global.pontuacao_pvp = [0, 0];
}