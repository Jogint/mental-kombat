//* Essa função define a energia máxima de um personagem

function scr_definir_energia_max(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 125 energia, máximo 500 energia
        show_error("Valor de 'aumento' inválido em scr_definir_energia_max: " + string(aumento), true);
    }
	
	var energia_max_padrao = 250;
	return energia_max_padrao * aumento;
}