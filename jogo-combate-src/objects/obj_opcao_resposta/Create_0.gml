/// @function atualizar_dados()
/// @description Altera a opção de resposta quando troca de pergunta

desenhar_circulo = false; // Variável para controlar o estado do desenho
tempo_feedback_bot = 0; // Timer para controlar a duração do feedback do bot

function atualizar_dados() {
	pergunta = global.pergunta_atual;
	valor_botao = scr_atribuir_alternativas();
	numero = valor_botao[0];
	is_certo = valor_botao[1];
}

atualizar_dados();