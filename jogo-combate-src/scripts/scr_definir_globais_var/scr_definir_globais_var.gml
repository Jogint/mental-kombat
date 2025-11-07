/// @function scr_definir_globais_var()
/// @description Inicializa e reseta as variáveis globais de estado da partida/jogo
/// @param {Bool} _reseta_pontuacao_pvp Decide se apaga os dados de vitória do pvp

function scr_definir_globais_var(_reseta_pontuacao_pvp) {
	if (_reseta_pontuacao_pvp) global.pontuacao_pvp = [0, 0]; // quantas vezes um player venceu. Reseta no menu
	
	// ==================================================
	// VARIAVEIS INSTANCIAS/OBJETOS
	// ==================================================
	global.ultimo_selecionado = noone; // usado durante a seleção de personagens
	global.perso_atuais = [noone, noone]; // quais obj_personagem (referências) cada instancia vai usar
	global.inst_perso_partida = []; // Instâncias (IDs) dos personagens em jogo
	global.inst_hud = []; // instâncias das barras de vida e eneria
	global.hab_visiveis = []; // guarda as habilidades do pop up enquanto aberto
	global.fundo_hab_visiveis = []; // guarda as instâncias dos fundos das habilidades visíveis
}