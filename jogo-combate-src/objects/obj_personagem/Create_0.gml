event_inherited(); // mantém o criar do obj pai

habilidades = [
	scr_definir_hab("Flechada", (round(energia_total * 0.25)), global.tipos_hab[HABS.ATAQUE], 30, spr_lily_1hab), // Dano
	scr_definir_hab("Pegue a Maçã", (round(energia_total * 0.5)), global.tipos_hab[HABS.CURA], 25, spr_lily_1hab), // Cura
	scr_definir_hab("Duzia de flechas", (round(energia_total)), global.tipos_hab[HABS.ATAQUE], 100, spr_lily_1hab), // Dano
]