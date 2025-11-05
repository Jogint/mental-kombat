scr_proxima_pergunta();
global.partida_acabou = false; // define o início da partida

// ===== POP UP SORTEIO DE PRIMEIRO JOGADOR =====
pop_up_aberto = false; // ? Também usado para o fim de jogo
estado_sorteio = 0; // 0: desativado, 1: escolhendo player, 2: exibindo resultado
qtd_frames_piscando = 0; // quanto tempo o nome pisca
nome_sorteado_atual = ""; // nome exibido

// ===== CONTAGEM DE TURNOS =====
quem_iniciou = ""; // guarda a informação de quem iniciou o turno lógica do global.qtd_turnos
passou_turno = false; // flag para aumentar 1x por turno

// ===== PARA MODO PVP =====
player_pontuou = false;

// ===== PARA MODO RAPIDO =====
pop_ups_abertos = false;