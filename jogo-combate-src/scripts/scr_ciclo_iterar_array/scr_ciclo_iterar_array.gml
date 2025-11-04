/// @function scr_ciclo_iterar_array(array, current_value, direction)
/// @param {Array<Any>} array O array a ser iterado sobre
/// @param {Any} valor_atual O valor de referencia a ser buscado no array
/// @param {Number} direcao A direção (1 para avançar, -1 para retroceder)
/// @return {Any} O novo valor.

function scr_ciclo_iterar_array(_array, _valor_atual, _direcao) {
    var _len = array_length(_array);
    var _i = array_get_index(_array, _valor_atual);
    
    if (_i < 0) {
        show_error("Valor atual '" + string(_valor_atual) + "' não encontrado no array.", true);
    }
    
    var _novo_i = _i + _direcao;
    
    // Lógica de "dar a volta" (loop)
    if (_novo_i >= _len) {
        _novo_i = 0; // Se for além do final, volta para o início.
    } else if (_novo_i < 0) {
        _novo_i = _len - 1; // Se for antes do início, volta para o final.
    }
    
    var _novo_valor = _array[_novo_i];
    
    if (_novo_valor == "") {
        _novo_i += _direcao;
        
        if (_novo_i >= _len) {
            _novo_i = 0;
        } else if (_novo_i < 0) {
            _novo_i = _len - 1;
        }
        _novo_valor = _array[_novo_i];
    }
    
    return _novo_valor;
}