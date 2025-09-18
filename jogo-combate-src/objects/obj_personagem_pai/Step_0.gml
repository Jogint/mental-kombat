//Verifica se é vez do personagem
meu_turno = (global.jogador_atual == controlador);

if (meu_turno) {
	if (!global.turno_iniciou) {
		scr_iniciar_timer_turno(tempo_turno); //ignora esse erro, a var é criada por script
		global.turno_iniciou = true;
	}
	
	global.timer_turno--;
	
	if (controlador != global.jogadores[0]) {
		// código se for player
		
		// Ele deve ser capaz de selecionar uma opção com mouse ou teclado
		// As opções podem ser objetos chamados "selecao", com eventos de clique
		// Se clicar num objeto com a variável "resposta_correta" equivalente a false, acaba
	} else {
		// código se for bot
		
		// O quadro de opções ainda deve ser visível para o player, mas numa cor acinzentada
		// indicando que ainda não é o turno dele
		// Acerto dos bots: acertar com base em % (fácil = 40% erro, médio = 20%, difícil = 10%)
		// Tempo de resposta: (fácil = 10 secs, médio = 6 secs, difícil = 3 secs)
	}
	// criar uma função que chama a próxima pergunta sempre que acerta
	// na fase de testes, as perguntas serão exibidas no draw do obj_controle_rodada
	
	if (global.errou_resposta) {
		global.timer_turno = 0; // força fim do turno
		global.errou_resposta = false;
	}
	
	if (global.timer_turno <= 0) {
        // mandar para tela de skills antes de trocar turno, pra atacar o oponente
		scr_trocar_turno()
		global.turno_iniciou = false;
    }
}
