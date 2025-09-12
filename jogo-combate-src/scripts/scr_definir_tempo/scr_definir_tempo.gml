//* Essa função define o tempo do personagem responder as questões (até errar)

function scr_definir_tempo(aumento){
	if(is_undefined(aumento)) aumento = 1;
	
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 15 segundos, máximo 60 segundos
        show_error("Valor de 'aumento' inválido em scr_definir_tempo: " + string(aumento), true);
    }
	
	var tempo_padrao = 30;
	return tempo_padrao * aumento;
}