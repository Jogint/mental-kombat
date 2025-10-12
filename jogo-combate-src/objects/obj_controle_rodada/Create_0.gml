scr_proxima_pergunta();

// ===== POP UP SORTEIO DE PRIMEIRO JOGADOR =====
pop_up_aberto = false; // ? Também usado para o fim de jogo
choosing_state = 0; // 0: desativado, 1: escolhendo player, 2: exibindo resultado
flicker_count = 0; // quanto tempo o nome pisca
current_selection_name = ""; // nome exibido

// ===== PARA MODO PVP =====
player_pontuou = false;