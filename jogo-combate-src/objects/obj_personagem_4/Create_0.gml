event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2),
	scr_definir_hab("Drenagem Leve", (round(energia_total * 0.1)), global.tipos_hab[3], 5, spr_teste_opcao), // Dreno (Mais Barato)
	scr_definir_hab("Aceleração", (round(energia_total * 0.45)), global.tipos_hab[6], 1.5, spr_teste_opcao), // Energético
	scr_definir_hab("Paralisia Temporal", (energia_total), global.tipos_hab[5], 0.6, spr_teste_opcao), // Atrasar (Custo Máx)
]