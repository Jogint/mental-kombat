// ==================================================
/// @description Confirmação escolha bot
// ==================================================

estado_turno = ESTADOS_TURNO.EXIBINDO_HAB;

// ---------- ENCERRA SE PULOU ----------
if (ultima_hab_usada == global.tipos_hab[HABS.PULAR]) exit;

// ---------- ATIVA ANIMAÇÃO DA HAB ESCOLHIDA ----------
scr_ativa_animacao(global.inst_perso_partida[1], ultima_hab_usada);

// ---------- VOLTA SPRITE PADRÃO ----------
altera_sprite_hab();