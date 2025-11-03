if (!personagem_gerenciado && array_length(global.inst_perso_partida)) {
	personagem_gerenciado = global.inst_perso_partida[index_vida];
}

if (personagem_gerenciado == noone) exit;

var _largura = sprite_get_width(sprite_index) - 1;
var _altura = sprite_get_height(sprite_index) - 1;
var _porcentagem_atual = personagem_gerenciado.hp_atual / personagem_gerenciado.hp_total;

draw_set_color(c_green);
draw_rectangle(x, y, x + (_largura * _porcentagem_atual), y + _altura, false);

draw_self();

scr_reset_draw();