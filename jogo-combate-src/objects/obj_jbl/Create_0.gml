// ==================================================
/// @description Inicia a música
// ==================================================

musica_atual = noone;
clique_cooldown = game_get_speed(gamespeed_fps) / 2;
cd_em_andamento = 0 // cd: cooldown
acabou_partida = false;

// ==================================================
// Funções de uso externo
// ==================================================

function toca_som_acertou() {
	audio_play_sound(snd_acerto, 2, false);
}

function toca_som_errou() {
	audio_play_sound(snd_erro, 2, false);
}

function toca_som_clicou() {
	if (cd_em_andamento <= 0) {
		cd_em_andamento = clique_cooldown;
		audio_play_sound(snd_clique, 2, false);
	}
}

function toca_som_venceu() {
	if (instance_exists(obj_gestao_rodada)) {
		if (obj_gestao_rodada.partida_acabou && !acabou_partida) {
			acabou_partida = true;
			audio_play_sound(snd_vitoria, 2, false);
		}
	}
}

function toca_som_perdeu() {
	if (instance_exists(obj_gestao_rodada)) {
		if (obj_gestao_rodada.partida_acabou && !acabou_partida) {
			acabou_partida = true;
			audio_play_sound(snd_derrota, 2, false);
		}
	}
}