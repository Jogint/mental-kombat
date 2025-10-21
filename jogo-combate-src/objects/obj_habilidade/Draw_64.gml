draw_set_color(c_black);
var _x = x - 95;

// TODO: Trocar pra draw_text_ext() quando entrarem os textos
draw_text(_x, y + 80, "Habilidade: " + string(habilidade.nome));
draw_text(_x, y + 100, "Custo: " + string(habilidade.custo));
draw_text(_x, y + 120, "Tipo: " + string(habilidade.tipo));

switch (habilidade.tipo) {
	case global.tipos_hab[2]:
		draw_text(_x, y + 140, "Quanta " + string(habilidade.tipo) + ": " + string(habilidade.valor_efeito));
		break;
	default:
		draw_text(_x, y + 140, "Quanto " + string(habilidade.tipo) + ": " + string(habilidade.valor_efeito));
		break;
}
