/// @function scr_definir_globais_var()
/// @description Reseta todas as variaveis de turno
/// @param {Bool} _reseta_pontuacao_pvp Decide se apaga os dados de vitória do pvp
function scr_definir_globais_var(_reseta_pontuacao_pvp) {
	
	global.jogador_atual = ""; // Indica quem pode responder a pergunta
	global.perso_atuais = [noone, noone]; // quais objetos de personagem cada instancia vai usar
	global.inst_perso_partida = []; // intâncias de personagens em jogo
	global.inst_hud = [] // instâncias das barras de vida e eneria
	global.ultimo_selecionado = noone; // usado durante a seleção de personagens
	global.perguntas_geradas = scr_gerar_perguntas(); // Banco de perguntas para a partida
	global.pergunta_atual = global.perguntas_geradas[0]; // A pergunta que está sendo exibida no momento
	global.partida_acabou = true; // começa sem partidas em andamento
	global.quem_venceu = "noone";
	if (_reseta_pontuacao_pvp) {global.pontuacao_pvp = [0, 0];} // define quantas vezes um player venceu. Reseta no menu
	global.timer_turno = 0; // Temporizador para o tempo de resposta
	global.turno_iniciou = false; // Flag para controlar o início do turno
	global.errou_resposta = false; // Flag para controlar se a resposta foi errada
	global.exibir_hab = false; // flag para abrir o pop up de habilidades
	global.hab_visiveis = []; // guarda as habilidades do pop up enquanto aberto
	global.fundo_hab_visiveis = []; // mesma coisa que de cima mas é o fundo
}