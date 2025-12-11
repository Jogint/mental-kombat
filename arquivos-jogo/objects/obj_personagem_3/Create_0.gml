event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Fatiando", (round(energia_total * 0.2)), global.tipos_hab[HABS.ATAQUE], 20, spr_larry_hab1),
	scr_definir_hab("Hora do lanche", (round(energia_total * 0.55)), global.tipos_hab[HABS.CURA], 20, spr_larry_hab2),
	scr_definir_hab("Delivery", (energia_total), global.tipos_hab[HABS.ATAQUE], 130, spr_larry_ult),
]