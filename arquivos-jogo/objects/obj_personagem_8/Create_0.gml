event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Transfere vida", (round(energia_total * 0.2)), global.tipos_hab[HABS.DRENA], 10, spr_kiki_hab1),
	scr_definir_hab("Meu tempo", (round(energia_total * 0.75)), global.tipos_hab[HABS.PRORROGA], 1.6, spr_kiki_hab2),
	scr_definir_hab("Magia de impedimento", (energia_total), global.tipos_hab[HABS.CONGELA], 0.6, spr_kiki_ult),
]