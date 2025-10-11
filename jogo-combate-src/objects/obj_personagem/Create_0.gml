event_inherited(); // mantém o criar do obj pai

habilidades = [
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2),
	scr_definir_hab("Nome1", (energia_total / 10), global.tipos_hab[1], 100, spr_teste_opcao),
	scr_definir_hab("Soberana", (energia_total / 7), global.tipos_hab[1], 15, spr_teste_opcao_1),
	scr_definir_hab("Nome3", (energia_total / 2), global.tipos_hab[1], 10, spr_teste_opcao),
]