/// @description Inserir texto
draw_self();

draw_set_color(c_black);

// TODO: Transformar esse bloco em script (usado em opcao_resposta e outros do menu)
var _texto = "Jogar!";
var _largura = string_width(_texto);
var _altura = string_height(_texto);
	
draw_text(x - _largura / 2, y - _altura / 2, _texto);
