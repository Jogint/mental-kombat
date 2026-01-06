// ==================================================
/// @description Passa de room
// ==================================================

if (instance_exists(obj_jbl)) obj_jbl.toca_som_clicou();

// ---------- Verifica se desbloqueou rápido ----------
if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
	if (!global.tem_modo_rapido) exit;
}

room_goto_next();