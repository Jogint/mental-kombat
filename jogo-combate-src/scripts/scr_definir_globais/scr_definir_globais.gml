function scr_definir_globais(){
	randomise();
	
	// DICIONÁRIO: globais apenas para evitar erros de escrita e afins
	global.operacao = ["sum", "sub", "mult", "divi"];
	global.jogadores = ["bot", "player"];
	global.dificuldades = ["facil", "medio", "dificil"];
	global.qtd_alternativas = 4;
	
	// USO COMPARTILHADO: variaveis acessadas em diferentes arquivos
	global.dificuldade = global.dificuldades[1]; // dificuldade das perguntas e tempo de resposta dos bots
	global.jogador_atual = global.jogadores[1]; // quem pode responder a pergunta naquele turno
	global.timer_turno = 0; // quanto tempo o jogador tem para responder
	global.turno_iniciou = false; // define quando deve chamar o scr_inicia_timer_turno
	global.perguntas_geradas = scr_gerar_perguntas(); // banco de perguntas a serem respondidas
	global.pergunta_atual = global.perguntas_geradas[0]; // Pergunta. Alterada em scr_proxima_pergunta
	global.errou_resposta = false; // Define quando zerar o timer ao errar
}