/// chamado em scr_definir_globais e scr_proxima_pergunta
function scr_gerar_perguntas() { //* gera 100 perguntas nas dificuldades facil e medio, 99 nas dificeis
    var perguntas = [];

    if (global.dificuldade_atual == global.niveis_dificuldade[2]) {
        for (var i = 0; i < 25; i++) {
            var n1 = irandom_range(0, 99);
            var n2 = irandom_range(0, 99);
			array_push(perguntas, gerar_opcoes(n1, n2, n1 + n2, global.operacoes[0])); // soma
			array_push(perguntas, gerar_opcoes(max(n1,n2), min(n1,n2), abs(n1-n2), global.operacoes[1])); // sub

            var n3 = irandom_range(1, 9); //? não pode dividir por zero
            var n4 = irandom_range(1, 9);
			array_push(perguntas, gerar_opcoes(n3, n4, n3 * n4, global.operacoes[2]));  // mult
			array_push(perguntas, gerar_opcoes(n3 * n4, n3, n4, global.operacoes[3]));  // div
        }
    } else if (global.dificuldade_atual == global.niveis_dificuldade[1]) {
        for (var i = 0; i < 33; i++) {
            var n1 = irandom_range(0, 99);
            var n2 = irandom_range(0, 99);
			array_push(perguntas, gerar_opcoes(n1, n2, n1 + n2, global.operacoes[0]));
			array_push(perguntas, gerar_opcoes(max(n1,n2), min(n1,n2), abs(n1-n2), global.operacoes[1]));
			
            var n3 = irandom_range(0, 9); //? mas pode multiplicar por 0
            var n4 = irandom_range(0, 9);
            array_push(perguntas, gerar_opcoes(n3, n4, n3 * n4, global.operacoes[2]));
        }
    } else {
        for (var i = 0; i < 50; i++) {
            var n1 = irandom_range(0, 9);
            var n2 = irandom_range(0, 9);
			array_push(perguntas, gerar_opcoes(n1, n2, n1 + n2, global.operacoes[0]));
			array_push(perguntas, gerar_opcoes(max(n1,n2), min(n1,n2), abs(n1-n2), global.operacoes[1]));
        }
    }
    return array_shuffle(perguntas);
}

// Cria as opções erradas da questão
function gerar_opcoes(num1, num2, certo, tipo) {
    var alternativas = [certo];
    while (array_length(alternativas) < global.qtd_alternativas) {
        var errado = certo + irandom_range(-10, 10);
        if (errado >= 0 && errado <= 188 && errado != certo && scr_valor_unico_array(alternativas, errado)) {
			if (tipo == global.operacoes[3]) { 
				if errado < 10 array_push(alternativas, errado);
			} else {
				array_push(alternativas, errado);
			}
        }
    }
	alternativas = array_shuffle(alternativas);

    return {
		conta: tipo,
        n1: num1,
        n2: num2,
        correto: certo,
        opcoes: alternativas
    };
}