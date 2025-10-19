event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2, 0),
	scr_definir_hab("Impulso", (round(energia_total * 0.18)), global.tipos_hab[6], 1.3, spr_teste_opcao, 4), // Energético (Mais Barato)
	scr_definir_hab("Ataque Veloz", (round(energia_total * 0.4)), global.tipos_hab[1], 25, spr_teste_opcao, 4), // Dano
	scr_definir_hab("Sobrecarga Energet.", (energia_total), global.tipos_hab[4], 1.8, spr_teste_opcao, 4), // Prorroga (Custo Máx)
]