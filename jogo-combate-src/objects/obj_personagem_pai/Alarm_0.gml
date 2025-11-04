/// @description Acertos bot
var _chance_acerto = irandom_range(1, 100);
var _i_dif = array_get_index(global.niveis_dif, global.dif_atual);
var _acerto_base = 50;
var _aumento_base = 20;
var _corte_acerto = clamp(_acerto_base + (_aumento_base * _i_dif), 0, 100);

// camada extra de verificação pq esse VIADO tá atacando sem poder
if (controlador == global.tipos_jogadores[0] ||
	global.modo_jogo_atual == global.modos_jogo[2]) {
	scr_acerto_bot(global.inst_perso_partida[1], _chance_acerto, _corte_acerto);
}
