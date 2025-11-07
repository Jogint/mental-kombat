/// @function scr_criar_personagem(obj, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max)
/// @description Inicializa os atributos principais de um personagem,
/// definindo vida, energia, tempo de turno e valores atuais.
/// @param {Id.Instance} obj Instância do personagem (self) que será configurada.
/// @param {Real} aumento_energia Fator de aumento da energia por acerto.
/// @param {Real} aumento_tempo Fator de aumento do tempo de turno.
/// @param {Real} aumento_vida Fator de aumento da vida total.
/// @param {Real} aumento_energia_max Fator de aumento da energia máxima.
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
	
	var hp_padrao = 50;
	return round(hp_padrao * aumento);
}

function definir_energia_max(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 50 energia, máximo 200 energia
        show_error("Valor de 'aumento' inválido em scr_definir_energia_max: " + string(aumento), true);
    }
	
	var energia_max_padrao = 100;
	return round(energia_max_padrao * aumento);
}

function definir_energia(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 3) {
		// mínimo 2 ponto, máximo 12 pontos
        show_error("Valor de 'aumento' inválido em scr_definir_energia: " + string(aumento), true);
    }
	
	var energia_padrao = 4;
	return round(energia_padrao * aumento);
}

function definir_tempo(aumento){
	if(is_undefined(aumento)) aumento = 1;
	
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 15 segundos, máximo 60 segundos
        show_error("Valor de 'aumento' inválido em scr_definir_tempo: " + string(aumento), true);
    }
	
	var tempo_padrao = 30;
	return round(tempo_padrao * aumento);
}