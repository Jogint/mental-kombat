/// @function scr_gerar_perguntas()
/// @description Cria 100 perguntas nas difs facil e medio, 99 nas dificeis
function scr_gerar_perguntas() {
    var _perguntas = [];
	var _novas_perguntas = [];
	var _nums;
	
	switch (global.dif_atual) {
		case global.niveis_dif[DIF.DIFICIL]:
			for (var i = 0; i < 25; i++) {
			    _nums = escolhe_4_nums(50, false);
				_novas_perguntas = gera_pergunta_por_operacao(_nums, true, true);
				_perguntas = array_concat(_perguntas, _novas_perguntas);
		    }
			break;
		case global.niveis_dif[DIF.MEDIO]:
			for (var i = 0; i < 33; i++) {
				_nums = escolhe_4_nums(50, true);
				_novas_perguntas = gera_pergunta_por_operacao(_nums, true, false);
				_perguntas = array_concat(_perguntas, _novas_perguntas);
			}
			break;
		case global.niveis_dif[DIF.FACIL]:
			for (var i = 0; i < 50; i++) {
				_nums = escolhe_4_nums(9, true);
				_novas_perguntas = gera_pergunta_por_operacao(_nums, false, false);
				_perguntas = array_concat(_perguntas, _novas_perguntas);
			}
			break;
		default:
			show_error("O modo de jogo atual não está dentre os válidos no switch. Recebeu " + global.dif_atual, true);
			break;
	}
    return array_shuffle(_perguntas);
}

/// @function escolhe_4_nums(_limite_basicos, _apenas_mult)
/// @description Define os valores de n1, n2, n3, e n4
/// @param {Real} _limite_basicos Valor máximo da soma e subtração
/// @param {bool} _apenas_mult Se n3 e n4 serão usados apenas para multiplicação (pode zero)
/// ou também para divisão (não pode zero)
/// @return {Array<Real>} [n1, n2, n3, n4]
function escolhe_4_nums(_limite_basicos, _apenas_mult){
	var _valor_inicial_n3_e_n4 = 1;
	if (_apenas_mult) _valor_inicial_n3_e_n4 = 0;
	return [
		irandom_range(0, _limite_basicos),
		irandom_range(0, _limite_basicos),
		irandom_range(_valor_inicial_n3_e_n4, 9),
		irandom_range(_valor_inicial_n3_e_n4, 9)
	];
}

/// @function gera_pergunta_por_operacao(_nums, _tem_mult, _tem_div)
/// @description Cria um struct para cada tipo de operação matemática
/// @param {Array<Real>} _nums Valores de n1 a n4
/// @param {bool} _tem_mult Se será gerado multiplicação
/// @param {bool} _tem_div Se será gerado divisão
/// @return {Array<Struct>}
function gera_pergunta_por_operacao(_nums, _tem_mult, _tem_div) {
	var _perguntas = [];
	
	array_push(_perguntas, gerar_opcoes(_nums[0], _nums[1], _nums[0] + _nums[1], global.operacoes[OPERACOES.SOMA])); // soma
	array_push(_perguntas, gerar_opcoes(max(_nums[0], _nums[1]), min(_nums[0], _nums[1]), abs(_nums[0] - _nums[1]), global.operacoes[OPERACOES.SUB])); // sub
	
	if (_tem_mult) {
		array_push(_perguntas, gerar_opcoes(_nums[2], _nums[3], _nums[2] * _nums[3], global.operacoes[OPERACOES.MULT]));  // mult
	}
	
	if (_tem_div) {
		array_push(_perguntas, gerar_opcoes(_nums[2] * _nums[3], _nums[2], _nums[3], global.operacoes[OPERACOES.DIVI]));  // div
	}
	
	return _perguntas;
}

/// @function gerar_opcoes(num1, num2, certo, tipo)
/// @description Cria as opções erradas da questão
/// @param {Real} num1 Primeiro numero na equação
/// @param {Real} num2 Segundo numero na equação
/// @param {Real} certo Resposta da operação
/// @param {String} tipo Qual a operação realizada
/// @return {Struct}
function gerar_opcoes(num1, num2, certo, tipo) {
    var _alternativas = [certo];
	var _resultado_maximo_possivel = 100; // resultado de 50 + 50
	if (tipo == global.operacoes[OPERACOES.DIVI]) { 
		_resultado_maximo_possivel = 9; // resultado da divisão sempre menor que 10
	}
	var _vezes_executado = 0;
	
    while (array_length(_alternativas) < global.qtd_alternativas) {
        var _errado = certo + irandom_range(-10, 10);
		
        if (_errado >= 0 &&
			_errado <= _resultado_maximo_possivel &&
			_errado != certo &&
			scr_valor_unico_array(_alternativas, _errado)) {
			array_push(_alternativas, _errado);
        }
		
		if (_vezes_executado > 50) { // Repetições máximas observadas: 25. Duplicado para margem de erro.
			show_error("Execução interrompida por risco de loop infinito. Dados de debug: tipo da conta - " + tipo + "; Resposta - " + string(certo), true);
			break;
		}
		
		_vezes_executado++
    }
	_alternativas = array_shuffle(_alternativas);

    return {
		conta: tipo,
        n1: num1,
        n2: num2,
        correto: certo,
        opcoes: _alternativas
    };
}