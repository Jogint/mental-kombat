/// @description Acertos bot

// ==================================================
// DURANTE A VEZ DO BOT OU MODO RÁPIDO
// ==================================================
if (!obj_gestao_rodada.partida_acabou &&
(controlador == global.tipos_jogadores[JOGADOR.BOT] ||
global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO])) {

	// ---------- CALCULAM O ACERTO ----------
	var _chance = irandom_range(1, 100);
	var _i_dif = array_get_index(global.niveis_dif, global.dif_atual);
	var _acerto_base = 75;
	var _aumento_base = 10;
	var _corte = clamp(_acerto_base + (_aumento_base * _i_dif), 0, 100);
	
	// ---------- VARIAVEIS GERAIS ----------
    var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
    var _bot_acertou_chance = (_chance <= _corte);

	// ---------- BOT ACERTOU ----------
    if (_bot_acertou_chance || _is_rapido) {
        aumentar_energia();
		bot_marcou_opcao(true);
        
	// ---------- BOT ERROU ----------
    } else {
		bot_marcou_opcao(false);
        if (!_is_rapido) {
            estado_turno = ESTADOS_TURNO.ESCOLHA_HAB;
        }
    }
}
