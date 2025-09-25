if (room == rm_trilha) {
	if (array_length(global.perso_atuais) == 1) room_goto_next();
} else if (room == rm_selecao_personagem) {
	if (array_length(global.perso_atuais) == 2) room_goto_next();
}
