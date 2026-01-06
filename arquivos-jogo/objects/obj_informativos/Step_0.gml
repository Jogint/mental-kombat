// ==================================================
/// @description Atualiza dados perso
// ==================================================

if (global.ultimo_selecionado && !instance_exists(obj_transicao)) {

	// ---------- Cria instancia e salva seus dados ----------
	if (global.ultimo_selecionado != temp_instance) {
		
		instance_destroy(temp_instance);
		temp_instance = instance_create_layer(0, 0, "ObjSelecionado", global.ultimo_selecionado);
				
		string_dados = [
			string(temp_instance.nome_personagem),
			"Vida total: " + string(temp_instance.hp_total),
			"Energia total: " + string(temp_instance.energia_total),
			"Ganho por acerto: " + string(temp_instance.energia_por_acerto),
			"Tempo por turno: " + string(temp_instance.tempo_turno)
		]
		
	}
		
    pop_up_aberto = true;
	
} else {
	pop_up_aberto = false;
}