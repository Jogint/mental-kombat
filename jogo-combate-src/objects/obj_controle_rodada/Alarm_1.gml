/// @description Exibe escolha
if (choosing_state == 2) {
    global.jogador_atual = current_selection_name;
    choosing_state = 0;
    current_selection_name = "";
	pop_up_aberto = false;
}