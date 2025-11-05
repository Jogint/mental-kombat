/// @description Exibe escolha
if (estado_sorteio == 2) {
    global.jogador_atual = nome_sorteado_atual;
    estado_sorteio = 0;
	quem_iniciou = nome_sorteado_atual;
    nome_sorteado_atual = "";
	pop_up_aberto = false;
}