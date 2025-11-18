event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Empurrão", (round(energia_total * 0.25)), global.tipos_hab[HABS.CONGELA], 0.7, spr_sr_kenzo_hab1),
	scr_definir_hab("Impactante", (round(energia_total * 0.45)), global.tipos_hab[HABS.ATAQUE], 36, spr_sr_kenzo_hab2),
	scr_definir_hab("Meditação", (energia_total), global.tipos_hab[HABS.CURA], hp_total, spr_sr_kenzo_ult),
]