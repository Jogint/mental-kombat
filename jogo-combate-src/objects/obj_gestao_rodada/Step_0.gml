// ==================================================
/// @description Eventos recorrentes da partida
// ==================================================

var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
var _is_pvp = global.modo_jogo_atual == global.modos_jogo[MODO.PVP];
if (_is_rapido) layer_set_visible("Opcoes", true);

// ==================================================
// EXECUTA O SORTEADOR DE QUEM COMEÇA ATACANDO
// ==================================================
if (obj_gestao_rodada.jogador_atual == noone &&
estado_sorteio == 0 &&
!instance_exists(obj_transicao) &&
!_is_rapido) {
    estado_sorteio = 1;
    var _tempo_piscando = 3; // 3 seconds
    var _frames_por_nome = 4; // Exibição do nome dura 4 frames
    qtd_frames_piscando = _tempo_piscando * (game_get_speed(gamespeed_fps) / _frames_por_nome);
    nome_sorteado_atual = global.inst_perso_partida[0].controlador; // primeiro nome
    alarm[0] = _frames_por_nome;
}

// ==================================================
// DEFINE O VENCEDOR DA RODADA
// ==================================================
if (partida_acabou) {
    var _perso_p1    = global.inst_perso_partida[0]; // Posição fixa do P1 no array da partida
    var _perso_outro = global.inst_perso_partida[1]; // Posição do adversário (Bot/P2)
	var _id_vencedor_bot = global.tipos_jogadores[JOGADOR.BOT];
    var _id_vencedor_p1 = global.tipos_jogadores[JOGADOR.P1];
    var _id_vencedor_p2  = global.tipos_jogadores[JOGADOR.P2];

    if (_perso_p1.hp_atual <= 0) {
        
        // ---------- Determina quem é o adversário pelo modo de jogo ----------
        if (global.modo_jogo_atual == global.modos_jogo[MODO.PVP]) { // Se Modo PvP/Rápido, o adversário é o P2.
            quem_venceu = _id_vencedor_p2;
			if (instance_exists(obj_jbl)) obj_jbl.toca_som_venceu();
        } else { // Se Modo História ([1]), o adversário é o Bot.
			quem_venceu = _id_vencedor_bot;
			if (instance_exists(obj_jbl)) obj_jbl.toca_som_perdeu();
        }

    } else if (_perso_outro.hp_atual <= 0) {
        quem_venceu = _id_vencedor_p1;
		if (instance_exists(obj_jbl)) obj_jbl.toca_som_venceu();
    } else {
        show_error("Ninguém venceu. HP de P1: " + string(_perso_p1.hp_atual) + " | HP do Adversário: " + string(_perso_outro.hp_atual), true);
    }
    
    quem_iniciou = noone; 
}

// ==================================================
// ATRIBUI PONTO AO PLACAR PVP
// ==================================================
if (partida_acabou && _is_pvp && !player_pontuou) {
	scr_pontua_pvp();
	player_pontuou = true;
}

// ==================================================
// CONTROLA O TIMER DO TURNO
// ==================================================
if (jogador_atual != noone) timer_turno--;

// ==================================================
// PERMITE O ATAQUE SIMULTÂNEO NO MODO RÁPIDO
// ==================================================
if (_is_rapido) {
	jogador_atual = "TODOS!";
	if (!pop_ups_abertos) {
		scr_toggle_hab(global.inst_perso_partida[0].habilidades);
		scr_toggle_hab(global.inst_perso_partida[1].habilidades);
		pop_ups_abertos = true;
	}
}

if (_is_rapido) exit; // ALERTA: NÃO COLOCAR CÓDIGO DO MODO RÁPIDO ABAIXO DISSO

// ==================================================
// CONTAGEM DE TURNOS DA PARTIDA
// ==================================================
if (quem_iniciou == jogador_atual) {
	if (!passou_turno) {
		qtd_turnos++;
		passou_turno = true;
	}
} else {
	passou_turno = false;
}