/// @description 
scr_definir_globais();

// Atribuição de constantes: hp_total, energia_total, energia_por_acerto e tempo_turno
// Variáveis: hp_atual, energia_atual
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);
show_debug_message("HP: " + string(hp_atual));



// ========== Teste de perguntas ==========

//var salvar_dif = global.dificuldade;

//if (!variable_instance_exists(id, "perguntas_geradas")) {
//	for (var i = 0; i < 3; i++) {
//		global.dificuldade = i;
//		perguntas_geradas = scr_gerar_perguntas();
//
//		var p = perguntas_geradas[0];
//
//		show_debug_message("===== TESTE DE PERGUNTA "+ string(i) +" =====");
//		show_debug_message("Conta: " + string(p.conta));
//		show_debug_message("N1: " + string(p.n1) + ", N2: " + string(p.n2));
//		show_debug_message("Resposta correta: " + string(p.correto));
//		show_debug_message("Opções: " + string(p.opcoes[0]) + ", " + string(p.opcoes[1]) + ", " + string(p.opcoes[2]) + ", " + string(p.opcoes[3]));
//	}
//	global.dificuldade = salvar_dif;
//}