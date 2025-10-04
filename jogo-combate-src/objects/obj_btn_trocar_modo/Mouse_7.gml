switch (global.modo_jogo_atual) {
	case global.modos_jogo[0]:
		global.modo_jogo_atual = global.modos_jogo[1];
		break;
	case global.modos_jogo[1]:
		global.modo_jogo_atual = global.modos_jogo[0];
		break;
	default:
		show_error("Modo de jogo não catalogado. Recebeu: " + string(global.modo_jogo_atual), true);
}