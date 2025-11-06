// DICIONÁRIO DE ABREVIAÇÕES EM NOTES/Importante.txt
randomise();

// ==================================================
// GLOBAIS BOOLEANAS
// ==================================================
global.tem_modo_rapido = false; // flag que libera o modo após zerar o jogo

// ==================================================
// GLOBAIS NUMÉRICAS
// ==================================================
global.qtd_alternativas = 4; // número de alternativas por questão
global.qtd_players_partida = 2; // número de jogadores por rodada
global.tamanhos = { // x e y
	personagem: 64 * 5,
	fundo_hab: [300, 80],
	logo_hab: 80,
}
// ==================================================
// GLOBAIS STRING
// ==================================================
global.operacoes = ["soma", "subtracao", "multiplicacao", "divisao"]; // tipos de operações válidas
global.tipos_jogadores = ["bot", "player1", "player2"]; // tipos de jogadores válidos
global.niveis_dif = ["facil", "medio", "dificil"]; // difs existentes no jogo
global.modos_jogo = ["2 jogadores", "história", "rápido"]; // modos de jogo disponíveis
global.tipos_hab = [ // nomes das diferentes habilidades a serem usados pelos personagens
	"Pular", 
	"Ataque", 
	"Cura", 
	"Drenar vida", 
	"Prorroga tempo", 
	"Acelera", 
	"Energético",
];
global.dif_atual = global.niveis_dif[DIF.FACIL]; // define o nível de dif da partida
global.modo_jogo_atual = global.modos_jogo[MODO.HIST]; // define o modo de jogo da partida

// ==================================================
// GLOBAIS INSTANCIAS/OBJETOS
// ==================================================
global.todos_perso = [ // referência de todos os objetos de personagem jogáveis
	obj_personagem,
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
	obj_personagem_11,
];
global.perso_disponiveis = [obj_personagem, obj_personagem_1]; // personagens jogaveis na trilha ou rapido
global.inimigos_disponiveis = [obj_personagem_2]; // inimigos derrotaveis na trilha

// ==================================================
// SCRIPTS INICIAIS
// ==================================================
scr_definir_globais_var(true);
scr_cria_enum(); // OBS: TODA ALTERAÇÃO NOS ARRAYS DE STRING DEVE SER FEITA TAMBÉM AQUI
// TODO: Tirar esse script ABAIXO e alterar as imagens na mão quando chegarem as artes de exibição
scr_atualizar_arr_sprites(); //cria o global.arr_sprite_perso {Array<GMSprite>}
