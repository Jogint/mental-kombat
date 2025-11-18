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
global.tamanhos = { // apenas um número para quadrados
	perso_padrao: 64,
	perso_maior: 64 * 5,
	dimensao_hab: [300, 80], // 300 espaçamento e 80 largura para ícone, contrário para fundo
	logo_hab: 80,
	inimigo_trilha: 96, // botao de seleção do personagem
}
global.numeros_gerais = {
	dano_p_mult: 20, // valor usado para dar dano com base na % do efeito (tempo/energia)
}
global.tempo_para_erro = []; // USADO PARA TESTES, REMOVER DPS

// ==================================================
// GLOBAIS STRING
// ==================================================
global.operacoes = ["soma", "subtracao", "multiplicacao", "divisao"]; // tipos de operações válidas
global.tipos_jogadores = ["Bot", "Jogador um", "Jogador dois"]; // tipos de jogadores válidos
global.niveis_dif = ["Fácil", "Médio", "Difícil"]; // difs existentes no jogo
global.modos_jogo = ["2 jogadores", "História", "Rápido"]; // modos de jogo disponíveis
global.tipos_hab = [ 
	"Pular", 
	"Ataque", 
	"Cura", 
	"Drenar vida", 
	"Prorroga tempo", 
	"Redução tempo", 
	"Energético",
]; // nomes das diferentes habilidades a serem usados pelos personagens
global.dif_atual = global.niveis_dif[DIF.FACIL]; // define o nível de dif da partida
global.modo_jogo_atual = global.modos_jogo[MODO.HIST]; // define o modo de jogo da partida

// ==================================================
// GLOBAIS INSTANCIAS/OBJETOS
// ==================================================
global.todos_perso = [ 
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
]; // referência de todos os objetos de personagem jogáveis

global.perso_disponiveis = [
	obj_personagem,
	obj_personagem_1,
]; // personagens jogaveis na trilha ou rapido

global.inimigos_disponiveis = [
	obj_personagem_2,
]; // inimigos derrotaveis na trilha

global.arr_sprite_perso = [
	spr_lily_foto,
	spr_toya_foto,
	spr_acerola_foto,
	spr_larry_foto,
	spr_atomizer_foto,
	spr_latte_foto,
	spr_niara_foto,
	spr_grumpy_foto,
	spr_kiki_foto,
	spr_emilio_foto,
	spr_sr_kenzo_foto,
	spr_umbros_foto,
]

// ==================================================
// SCRIPTS INICIAIS
// ==================================================
scr_definir_globais_var(true);
scr_cria_enum(); // OBS: TODA ALTERAÇÃO NOS ARRAYS DE STRING DEVE SER FEITA TAMBÉM AQUI
// TODO: Tirar esse script ABAIXO e alterar as imagens na mão quando chegarem as artes de exibição
//scr_atualizar_arr_sprites(); //cria o global.arr_sprite_perso {Array<GMSprite>}
