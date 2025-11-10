// ==================================================
/// @description Confirmação escolha bot
// ==================================================

// ---------- ENCERRA SE PULOU ----------
if (ultima_hab_usada == global.tipos_hab[HABS.PULAR]) {
	estado_turno = ESTADOS_TURNO.FINALIZANDO;
	exit;
}

// ---------- ATIVA ANIMAÇÃO DA HAB ESCOLHIDA ----------
scr_ativa_animacao(global.inst_perso_partida[1], ultima_hab_usada);

// ---------- TROCA A SPRITE DA HABILIDADE ESCOLHIDA ----------
altera_sprite_hab(spr_hab_indisponivel);