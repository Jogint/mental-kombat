/// @description Variáveis
scr_definir_globais();

//? A função abaixo adiciona ao objeto:
// Constantes: hp_total, energia_total, energia_por_acerto e tempo_turno
// Variáveis: hp_atual, energia_atual
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);
controlador = global.jogadores[1];
meu_turno = false;
errou_resposta = false;




// ========== Teste de perguntas ==========

var salvar_dif = global.dificuldade;

if (!variable_instance_exists(id, "perguntas_geradas")) {
	for (var i = 0; i < 3; i++) {
		global.dificuldade = global.dificuldades[i];
		perguntas_geradas = scr_gerar_perguntas();

		var p = perguntas_geradas[0];
		
		// ===== teste específico =====
		//if (global.dificuldade == global.dificuldades[2]) {
		//	for (var j = 1; j < array_length(perguntas_geradas); j++) {
		//		p = perguntas_geradas[j];
		//		if p.conta == global.operacao[2] break
		//	}
		//}
		

		show_debug_message("===== TESTE DE PERGUNTA "+ string_upper(global.dificuldade) +" =====");
		show_debug_message("Conta: " + string(p.conta));
		show_debug_message("N1: " + string(p.n1) + ", N2: " + string(p.n2));
		show_debug_message("Resposta correta: " + string(p.correto));
		show_debug_message("Opções: " + string(p.opcoes[0]) + ", " + string(p.opcoes[1]) + ", " + string(p.opcoes[2]) + ", " + string(p.opcoes[3]));
	}
	global.dificuldade = salvar_dif;
}