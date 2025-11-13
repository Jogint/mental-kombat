// ==================================================
/// @description Confirmação escolha bot
// ==================================================

estado_turno = ESTADOS_TURNO.EXIBINDO_HAB;

// ---------- ENCERRA SE PULOU ----------
if (ultima_hab_usada == global.tipos_hab[HABS.PULAR]) exit;

// ---------- ATIVA ANIMAÇÃO DA HAB ESCOLHIDA ----------
scr_ativa_animacao(global.inst_perso_partida[1], ultima_hab_usada);

// ---------- TROCA A SPRITE DA HABILIDADE ESCOLHIDA ----------
altera_sprite_hab(spr_hab_indisponivel);