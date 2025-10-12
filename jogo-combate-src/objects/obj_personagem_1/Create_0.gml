event_inherited(); // mantém o criar do obj pai

habilidades = [
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2),
	scr_definir_hab("HabilidadeBot", (energia_total / 10), global.tipos_hab[1], 5, spr_teste_opcao),
	scr_definir_hab("Nome2", (energia_total / 5), global.tipos_hab[2], 5, spr_teste_opcao_1),
	scr_definir_hab("Nome3", (energia_total / 2), global.tipos_hab[1], 10, spr_teste_opcao),
]