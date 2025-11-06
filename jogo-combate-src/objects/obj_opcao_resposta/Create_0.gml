/// @function atualizar_dados()
/// @description Altera a opção de resposta quando troca de pergunta

desenhar_circulo = false; // Variável para controlar o estado do desenho
tempo_feedback_bot = 0; // Timer para controlar a duração do feedback do bot
pergunta = noone;
qtd_frames_tremendo = 0;
frames_por_mexida = 4; // Exibição dura 4 frames
x_base = x;
player_atual = noone;

function atualizar_dados() {
	pergunta = obj_gestao_rodada.pergunta_atual;
	valor_botao = scr_atribuir_alternativas();
	numero = valor_botao[0];
	is_certo = valor_botao[1];
}

function treme_opcao() {
	player_atual.retornou_erro = true;
	var _tempo_tremendo = 1; // em segs
    qtd_frames_tremendo = _tempo_tremendo * (game_get_speed(gamespeed_fps) / frames_por_mexida);
    alarm[0] = frames_por_mexida;
}

