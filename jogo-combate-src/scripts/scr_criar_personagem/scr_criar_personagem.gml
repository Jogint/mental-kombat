function scr_criar_personagem(obj, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max) {
    with (obj) {
		hp_total = definir_vida(aumento_vida);
		energia_total = definir_energia_max(aumento_energia_max);
		energia_por_acerto = definir_energia(aumento_energia);
        tempo_turno = definir_tempo(aumento_tempo);
		hp_atual = hp_total;
		energia_atual = 0;
	}
}

//* ===== FUNÇÕES INTERMEDIÁRIAS =====

function definir_vida(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 25 hp, máximo 100 hp
        show_error("Valor de 'aumento' inválido em scr_definir_vida: " + string(aumento), true);
    }
	
	var energia_padrao = 50;
	return energia_padrao * aumento;
}

function definir_energia_max(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 125 energia, máximo 500 energia
        show_error("Valor de 'aumento' inválido em scr_definir_energia_max: " + string(aumento), true);
    }
	
	var energia_max_padrao = 250;
	return energia_max_padrao * aumento;
}

function definir_energia(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 3) {
		// mínimo 1 ponto, máximo 6 pontos
        show_error("Valor de 'aumento' inválido em scr_definir_energia: " + string(aumento), true);
    }
	
	var energia_padrao = 2;
	return energia_padrao * aumento;
}

function definir_tempo(aumento){
	if(is_undefined(aumento)) aumento = 1;
	
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 15 segundos, máximo 60 segundos
        show_error("Valor de 'aumento' inválido em scr_definir_tempo: " + string(aumento), true);
    }
	
	var tempo_padrao = 30;
	return tempo_padrao * aumento;
}