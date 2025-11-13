/// @function scr_ativa_animacao(hab)
/// @description Efetua o inicio da animação do personagem
/// @param {Asset.GMObject|Id.Instance} obj Objeto que está atacando
/// @param {Struct|String} hab Qual habilidade foi selecionada

function scr_ativa_animacao(obj, hab){
	var _chaves = variable_struct_get_names(hab);
		
    if (array_length(_chaves) == 0) { // struct vazio = pulo
		obj.estado_turno = ESTADOS_TURNO.EXIBINDO_HAB;
	    return;
	}
	
	with (obj) {
		energia_atual -= hab.custo;
		sprite_index = hab.sprite;
		hab_em_uso = hab;
		estado_turno = ESTADOS_TURNO.EXIBINDO_HAB
	}
	
}

// REMOVE: Cheio de atribuições indevidas aqui