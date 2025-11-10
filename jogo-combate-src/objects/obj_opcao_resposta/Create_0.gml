// ==================================================
/// @description Vars e Funções
// ==================================================

// ---------- Variáveis gerais ----------
desenhar_circulo = false; // Variável para controlar o estado do desenho
tempo_feedback_bot = 0; // Tempo de desenho do círculo
pergunta = noone; // Qual a pergunta atual sendo exibida
player_atual = noone; // Qual instância está jogando
bot_acertou = true;

// ---------- Controle do review de erro (tremida) ----------
qtd_frames_tremendo = 0; // Tempo de exibição de cada movimento
frames_por_mexida = 4; // Exibição dura 4 frames
x_base = x;

// ==================================================
// Funções de uso interno
// ==================================================

/// @function atualizar_dados
/// @description Altera a opção de resposta quando troca de pergunta
function atualizar_dados() {
	pergunta = obj_gestao_rodada.pergunta_atual;
	valor_botao = scr_atribuir_alternativas();
	numero = valor_botao[0];
	is_certo = valor_botao[1];
}

/// @function treme_opcao
/// @description Treme a opção clicada num período de 1 segundo
function treme_opcao() {
	player_atual.treme_resposta_errada = true;
	var _tempo_tremendo = 0.5; // em segs
    qtd_frames_tremendo = _tempo_tremendo * (game_get_speed(gamespeed_fps) / frames_por_mexida);
    alarm[0] = frames_por_mexida;
}

/// @function opcao_selecionada
/// @description Ativa o desenho do círculo de feedback e o timer (se for do bot).
/// @param {boolean} _exibe_bot Se o usuário acertou (feedback do jogo) ou se é seleção do jogador.
function opcao_selecionada(_exibe_bot = false, _acertou = true) {
    var _is_bot = (obj_gestao_rodada.jogador_atual == global.tipos_jogadores[JOGADOR.BOT]);
    
    // ---------- Feedback do Jogador ----------
    if (!_is_bot &&
	mouse_check_button(mb_left) &&
	position_meeting(mouse_x, mouse_y, id) &&
	qtd_frames_tremendo <= 0) {
        desenhar_circulo = true;
        return;
    } else {desenhar_circulo = false;}
    
    // ---------- Feedback do Jogador (hover) ----------// Feedback do Bot/Jogo (_exibe_bot = true)
    if (_exibe_bot) {
        desenhar_circulo = true;
        tempo_feedback_bot = game_get_speed(gamespeed_fps); 
    }
	
	if (!_acertou) {bot_acertou = false; treme_opcao();} // apenas caso o bot erre TODO: Mover pois não faz parte dessa função
}