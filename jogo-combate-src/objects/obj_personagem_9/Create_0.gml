event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2),
	scr_definir_hab("Escudo", (round(energia_total * 0.28)), global.tipos_hab[2], 18, spr_teste_opcao), // Cura (Mais Barato)
	scr_definir_hab("Atraso Inibidor", (round(energia_total * 0.55)), global.tipos_hab[5], 0.7, spr_teste_opcao), // Atrasar
	scr_definir_hab("Colapso", (energia_total), global.tipos_hab[1], 50, spr_teste_opcao), // Dano (Custo Máx)
]