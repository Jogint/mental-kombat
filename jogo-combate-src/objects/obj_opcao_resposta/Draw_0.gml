/// TODO arrumar a máscara de colisão dos círculos, trocar esse draw circle por um sprite
//draw_self();

var _raio = 32
var _font_size = 9

draw_set_color(c_white);

if (global.jogador_atual != global.tipos_jogadores[0] && mouse_check_button(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        draw_set_color(c_red);
    }
}

draw_circle(x + _raio - 1, y + _raio - 1, _raio, false);


draw_set_color(c_black);
draw_text(x + _raio - _font_size, y + _raio - _font_size, string(numero));
