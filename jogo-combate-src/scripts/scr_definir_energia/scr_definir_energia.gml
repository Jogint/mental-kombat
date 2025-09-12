//* Essa função define quanta energia o personagem ganha por acerto

function scr_definir_energia(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 3) {
		// mínimo 1 ponto, máximo 6 pontos
        show_error("Valor de 'aumento' inválido em scr_definir_energia: " + string(aumento), true);
    }
	
	var energia_padrao = 2;
	return energia_padrao * aumento;
}