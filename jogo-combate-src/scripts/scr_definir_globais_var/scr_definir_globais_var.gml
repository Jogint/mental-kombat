/// @function scr_definir_globais_var()
/// @description Inicializa e reseta as variáveis globais de estado da partida/jogo
/// @param {Bool} _reseta_pontuacao_pvp Decide se apaga os dados de vitória do pvp

function scr_definir_globais_var(_reseta_pontuacao_pvp) {
	
	// ==================================================
	// GLOBAIS NUMÉRICAS
	// ==================================================
	global.timer_turno = 0; // contador do tempo de turno em andamento
	if (_reseta_pontuacao_pvp) {global.pontuacao_pvp = [0, 0];} // quantas vezes um player venceu. Reseta no menu
	
	// ==================================================
	// GLOBAIS STRING
	// ==================================================
	global.jogador_atual = noone; // guarda uma string dentre global.tipos_jogadores de quem responde
	global.quem_venceu = noone; // guarda uma string dentre global.tipos_jogadores de quem venceu
	
	// ==================================================
	// GLOBAIS INSTANCIAS/OBJETOS
	// ==================================================
	global.ultimo_selecionado = noone; // usado durante a seleção de personagens
	global.perso_atuais = [noone, noone]; // quais obj_personagem (referências) cada instancia vai usar
	global.inst_perso_partida = []; // Instâncias (IDs) dos personagens em jogo
	global.inst_hud = []; // instâncias das barras de vida e eneria
	global.hab_visiveis = []; // guarda as habilidades do pop up enquanto aberto
	global.fundo_hab_visiveis = []; // guarda as instâncias dos fundos das habilidades visíveis
	
	// ==================================================
	// GLOBAIS STRUCT
	// ==================================================
	global.perguntas_geradas = scr_gerar_perguntas(); // banco de perguntas para a partida
	global.pergunta_atual = global.perguntas_geradas[0]; // A pergunta que está sendo exibida no momento
	
	// ==================================================
	// GLOBAIS BOOLEANAS
	// ==================================================
	global.partida_acabou = true; // flag para executar os comandos de partida
	global.turno_iniciou = false; // flag para controlar o início do turno
	global.errou_resposta = false; // flag para controlar se a resposta foi errada
	global.exibir_hab = false; // flag para abrir o pop up de habilidades
	
}