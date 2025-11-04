// perso = personagem
// hab = habilidade
function definir_globais() {
	randomise();
	/// DEFINIÇÕES DO JOGO: Declarações fixas para evitar erros de digitação.
	global.operacoes = ["soma", "subtracao", "multiplicacao", "divisao"];
	global.tipos_jogadores = ["bot", "player1", "player2"];
	global.niveis_dificuldade = ["facil", "medio", "dificil"];
	global.modos_jogo = ["2 jogadores", "história", ""];
	global.tipos_hab = ["pular", "dano", "cura", "dreno", "prorroga", "acelera", "energetico"];
	global.qtd_alternativas = 4;
	global.qtd_players_partida = 2;
	global.todos_perso = [obj_personagem,
						obj_personagem_1,
						obj_personagem_2,
						obj_personagem_3,
						obj_personagem_4,
						obj_personagem_5,
						obj_personagem_6,
						obj_personagem_7,
						obj_personagem_8,
						obj_personagem_9,
						obj_personagem_10,
						obj_personagem_11];
	scr_atualizar_arr_sprites(); //cria o global.arr_sprite_perso
	global.perso_disponiveis = [obj_personagem, obj_personagem_1]; // personagens jogaveis na trilha + rapido
	global.inimigos_disponiveis = [obj_personagem_2]; // inimigos derrotaveis na trilha
	global.dificuldade_atual = global.niveis_dificuldade[0]; // Define o nível de dificuldade da partida
	global.modo_jogo_atual = global.modos_jogo[1];
	
	scr_definir_globais_var(true);
}

definir_globais();