switch (room) {
	case rm_trilha:
		if (global.perso_atuais[1] == noone) {
			image_alpha = 0;
		} else {
			image_alpha = 1;
		}
	break;
	
	case rm_selecao_personagem:
		if (global.ultimo_selecionado == noone) {
			image_alpha = 0;
		} else {
			image_alpha = 1;
		}
	break;
}
