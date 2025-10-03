if (pop_up_aberto) {
	room_goto(0);
	if(instance_exists(obj_definir_globais)) {
		obj_definir_globais.definir_globais();
	} else {
		instance_create_layer(0, 0, "CriarGlobais", obj_definir_globais);
	}
}