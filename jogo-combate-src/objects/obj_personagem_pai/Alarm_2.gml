/// @description Aplica habilidade
scr_ativa_animacao(global.inst_perso_partida[1], ultima_hab_usada);
altera_sprite_hab(spr_hab_indisponivel);
if (global.modo_jogo_atual != global.modos_jogo[MODO.RAPIDO]) alarm[0] = -1; // evitar problemas