switch (global.dificuldade_atual) {
	case global.niveis_dificuldade[0]:
		global.dificuldade_atual = global.niveis_dificuldade[1];
		break;
	case global.niveis_dificuldade[1]:
		global.dificuldade_atual = global.niveis_dificuldade[2];
		break;
	case global.niveis_dificuldade[2]:
		global.dificuldade_atual = global.niveis_dificuldade[0];
		break;
	default:
		show_error("Dificuldade não catalogada. Recebeu: " + string(global.dificuldade_atual), true);
}