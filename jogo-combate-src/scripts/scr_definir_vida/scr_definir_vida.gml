//* Essa função define quanta energia o personagem ganha por acerto

function scr_definir_vida(aumento){
	if(is_undefined(aumento)) aumento = 1;
		
	if (aumento < 0.5 || aumento > 2) {
		// mínimo 25 hp, máximo 100 hp
        show_error("Valor de 'aumento' inválido em scr_definir_vida: " + string(aumento), true);
    }
	
	var energia_padrao = 50;
	return energia_padrao * aumento;
}