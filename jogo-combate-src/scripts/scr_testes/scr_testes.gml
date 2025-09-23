function exibir_perguntas(){
	var _salvar_dif = global.dificuldade_atual;

	if (!variable_instance_exists(id, "perguntas_geradas")) {
		for (var i = 0; i < 3; i++) {
			global.dificuldade_atual = global.niveis_dificuldade[i];
			perguntas_geradas = scr_gerar_perguntas();

			var _p = perguntas_geradas[0];
		
			// ===== teste específico =====
			//if (global.dificuldade_atual == global.niveis_dificuldade[2]) {
			//	for (var j = 1; j < array_length(perguntas_geradas); j++) {
			//		_p = perguntas_geradas[j];
			//		if p.conta == global.operacoes[2] break
			//	}
			//}
		

			show_debug_message("===== TESTE DE PERGUNTA "+ string_upper(global.dificuldade_atual) +" =====");
			show_debug_message("Conta: " + string(_p.conta));
			show_debug_message("N1: " + string(_p.n1) + ", N2: " + string(_p.n2));
			show_debug_message("Resposta correta: " + string(_p.correto));
			show_debug_message("Opções: " + string(_p.opcoes[0]) + ", " + string(_p.opcoes[1]) + ", " + string(_p.opcoes[2]) + ", " + string(_p.opcoes[3]));
		}
		global.dificuldade_atual = _salvar_dif;
	}
}