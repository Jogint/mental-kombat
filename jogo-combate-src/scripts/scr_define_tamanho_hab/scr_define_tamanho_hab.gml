/// @function define_tamanho_habilidades(_is_rapido, i)
/// @description Retorna os valores de [x, y, largura, altura]
/// @param {Real} i Índice do for loop
/// @param {bool} _is_rapido Se o modo atual é o modo rápido
/// @param {Real} _espaco_entre Espaçamento entre cada item centralizado
/// @param {Real} _largura_desejada Largura do objeto QUADRADO
/// @param {bool} _is_bg Se o código será usado para fazer o fundo do card no draw
/// @return {Array<Real>} [x, y, largura, altura]
function scr_define_tamanho_hab(i, _is_rapido, _espaco_entre, _largura_desejada, _is_bg) {
	var _altura_desejada = _largura_desejada;
	if (_is_bg) _altura_desejada = _largura_desejada * 1.5;
	var _total_instancias = 3;
	var _y = 200; if (_is_bg) _y = 170;
	var _largura_total_conjunto = (_largura_desejada * _total_instancias) + (_espaco_entre * (_total_instancias - 1));
	var _x_inicial = (window_get_width() / 2) - (_largura_total_conjunto / 2) + 40;
    var _x = _x_inicial + (i * (_largura_desejada + _espaco_entre));
			
	if (_is_rapido) { // chamado apenas 1x por partida, rodando obrigatóriamente 8 vezes
		static _entradas = 0;
				
		if (_entradas < 4) {
			_x = 10;
			_entradas++;
		} else {
			_x = 1276;
			_entradas++;
		}
		
		if (_entradas == 8) _entradas = 0; // Todos os dois arrays foram percorridos
		
		_y = 200 + (i * (_altura_desejada + 30));
	}
	
	return [_x, _y, _largura_desejada, _altura_desejada];
}