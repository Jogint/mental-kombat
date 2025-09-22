draw_set_color(c_black);
draw_text(x, y, "Habilidade: " + string(habilidade.nome));
draw_text(x, y + 20, "Custo: " + string(habilidade.custo));
draw_text(x, y + 40, "Tipo: " + string(habilidade.tipo));

switch (habilidade.tipo) {
	case global.tipos_hab[1]:
		draw_text(x, y + 60, "Quanto " + string(habilidade.tipo) + ": " + string(habilidade.valor_efeito));
		break;
	case global.tipos_hab[2]:
		draw_text(x, y + 60, "Quanta " + string(habilidade.tipo) + ": " + string(habilidade.valor_efeito));
		break;
	default:
		break;
}
