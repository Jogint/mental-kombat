// ==================================================
/// @description Exibe a escolha
// ==================================================

if (estado_sorteio == 2) {
    obj_gestao_rodada.jogador_atual = nome_sorteado_atual; // REMOVE: atribuição indevida
    estado_sorteio = 0;
	quem_iniciou = nome_sorteado_atual;
    nome_sorteado_atual = "";
	pop_up_aberto = false;
	
	// torna visível pós seleção
	layer_set_visible("Opcoes", true);
	if(instance_exists(obj_relogio_turno)) obj_relogio_turno.visible = true;
}