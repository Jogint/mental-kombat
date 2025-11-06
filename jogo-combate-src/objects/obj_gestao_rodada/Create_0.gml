// ==================================================
// VARIÁVEIS DE USO GERAL DA PARTIDA
// ==================================================

// ---------- VARIAVEIS NUMÉRICAS ----------
timer_turno = 0; // contador do tempo de turno em andamento
qtd_turnos = 0; // quantos turnos foram jogados nesta partida

// ---------- VARIAVEIS STRING ----------
jogador_atual = noone; // guarda uma string dentre global.tipos_jogadores de quem responde
quem_venceu = noone; // guarda uma string dentre global.tipos_jogadores de quem venceu

// ---------- VARIAVEIS STRUCT ----------
perguntas_geradas = scr_gerar_perguntas(); // banco de perguntas para a partida
pergunta_atual = perguntas_geradas[0]; // A pergunta que está sendo exibida no momento

// ---------- VARIAVEIS BOOLEANAS ----------
errou_resposta = false; // flag para controlar se a resposta foi errada
exibir_hab = false; // flag para abrir o pop up de habilidades
partida_acabou = false; // define o início da partida

// ==================================================
// VARIÁVEIS DE USO PRÓPRIO
// ==================================================

// ---------- POP UP SORTEIO DE PRIMEIRO JOGADOR ----------
pop_up_aberto = false; // ? Também usado para o fim de jogo
estado_sorteio = 0; // 0: desativado, 1: escolhendo player, 2: exibindo resultado
qtd_frames_piscando = 0; // quanto tempo o nome pisca
nome_sorteado_atual = ""; // nome exibido

//---------- CONTAGEM DE TURNOS ----------
quem_iniciou = ""; // guarda a informação de quem iniciou o turno lógica do qtd_turnos
passou_turno = false; // flag para aumentar 1x por turno

// ---------- PARA MODO PVP ----------
player_pontuou = false;

// ---------- PARA MODO RAPIDO ----------
pop_ups_abertos = false;