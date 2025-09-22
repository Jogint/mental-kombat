function scr_inserir_players(){
	var _camada_alvo = "Instances"; 

	for (var i = 0; i < array_length(global.perso_atuais); i++) {
	    var _obj_a_criar = global.perso_atuais[i];
    
	    // Define a posição para a nova instância. 
	    var _x = 950 - (i * 850);
	    var _y = 200;
    
	    // Cria a instância e guarda o ID dela na variável
	    var _nova_instancia = instance_create_layer(_x, _y, _camada_alvo, _obj_a_criar);

		// Define o tamanho do obj
		with (_nova_instancia) {
			controlador = global.tipos_jogadores[i];
		
			var _largura_desejada = 64 * 5;
			var _altura_desejada = 64 * 5;
			scr_trocar_sprite(self, _largura_desejada, _altura_desejada, sprite_index);
		}

	    // Adiciona o ID da nova instância ao array
	    array_push(global.inst_perso_partida, _nova_instancia);
	}
}