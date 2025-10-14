event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2),
	scr_definir_hab("Drenagem", (round(energia_total * 0.15)), global.tipos_hab[3], 10, spr_teste_opcao), // Dreno (Mais Barato)
	scr_definir_hab("Aprimoramento", (round(energia_total * 0.4)), global.tipos_hab[6], 1.6, spr_teste_opcao), // Energético
	scr_definir_hab("Vazio da Alma", (energia_total), global.tipos_hab[3], 60, spr_teste_opcao), // Dreno (Custo Máx)
]