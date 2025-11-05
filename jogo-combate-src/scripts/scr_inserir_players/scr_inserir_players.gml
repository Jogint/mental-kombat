/// @function scr_inserir_players()
/// @description Cria as duas instâncias de personagens na rm_combate
function scr_inserir_players(){
	var _camada_alvo = "Instances"; 

	for (var i = 0; i < array_length(global.perso_atuais); i++) {
	    var _obj_a_criar = global.perso_atuais[i];
    
		// Define a posição para a nova instância.
		var _x = 260 + (i * 512);
	    var _y = 460;
    
	    // Cria a instância e guarda o ID dela na variável
	    var _nova_instancia = instance_create_layer(_x, _y, _camada_alvo, _obj_a_criar);

		// Define quem controla cada instância
		static _player_seleciona = true;
		with (_nova_instancia) {
			if (global.modo_jogo_atual == global.modos_jogo[MODO.PVP]) {
				controlador = global.tipos_jogadores[i + 1]; // caso multplayer, ignora o bot
			} else {
				if (_player_seleciona) {
					controlador = global.tipos_jogadores[JOGADOR.P1];
					_player_seleciona = false;
				} else {
					controlador = global.tipos_jogadores[JOGADOR.BOT];
					_player_seleciona = true
				}
			}
			
			var _largura_desejada = 64 * 5;
			var _altura_desejada = 64 * 5;
			scr_trocar_sprite(self, _largura_desejada, _altura_desejada, sprite_index);
		}

	    // Adiciona o ID da nova instância ao array
	    array_push(global.inst_perso_partida, _nova_instancia);
	}
}