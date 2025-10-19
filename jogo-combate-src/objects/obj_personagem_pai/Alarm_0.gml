/// @description Acertos bot
var _chance_acerto = irandom_range(1, 100);
var _i_dificuldade = array_get_index(global.niveis_dificuldade, global.dificuldade_atual);
var _acerto_base = 50;
var _aumento_base = 20;
var _corte_acerto = clamp(_acerto_base + (_aumento_base * _i_dificuldade), 0, 100);
// camada extra de verificação pq esse VIADO tá atacando sem poder

// ERRO: Se trocar o inst por self, ele ataca, mas pontuação vai pro oponente
if (controlador == global.tipos_jogadores[0]) scr_acerto_bot(global.inst_perso_partida[1], _chance_acerto, _corte_acerto);
