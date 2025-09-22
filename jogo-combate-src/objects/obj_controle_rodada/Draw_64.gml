draw_set_color(c_white);

// Texto da pergunta
var _texto_pergunta = "Pergunta para " + string(global.jogador_atual) + ": " + string(global.pergunta_atual.n1);
switch (global.pergunta_atual.conta) {
	case global.operacoes[0]:
		_texto_pergunta += " + ";
		break;
	case global.operacoes[1]:
		_texto_pergunta += " - ";
		break;
	case global.operacoes[2]:
		_texto_pergunta += " * ";
		break;
	case global.operacoes[3]:
		_texto_pergunta += " / ";
		break;
	default:
		show_error("Operação matemática não identificada pelo switch, recebeu: " + global.pergunta_atual.conta, true)
}
_texto_pergunta += string(global.pergunta_atual.n2);
draw_text(x, y, _texto_pergunta);
draw_text(x, y - 15, "Tempo restante: " + string(round(global.timer_turno / game_get_speed(gamespeed_fps))));

// vida dos personagens PROVISÓRIO
draw_text(1085, 40, "vida: " + string(global.inst_perso_partida[0].hp_atual) + " | energia: " + string(global.inst_perso_partida[0].energia_atual));
draw_text(100, 40, "vida: " + string(global.inst_perso_partida[1].hp_atual) + " | energia: " + string(global.inst_perso_partida[1].energia_atual));