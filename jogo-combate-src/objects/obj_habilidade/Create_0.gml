alterou = false;
image_alpha = 0.5;

function gera_descricao(_hab) {
	switch (_hab.tipo) {
		case global.tipos_hab[1]:
			return "Use esta habilidade para causar dano ao seu oponente";
		case global.tipos_hab[2]:
			return "Gaste um pouco da sua energia para curar sua vida e impedir a derrota";
		case global.tipos_hab[3]:
			return "Atinja seu oponente ao mesmo tempo que recebe cura equivalente ao dano";
		case global.tipos_hab[4]:
			return "Torne seu relógio mais lento e tenha mais tempo para juntar mais energia";
		case global.tipos_hab[5]:
			return "Impeça seu oponente de encher a energia! Reduza o tempo de resposta dele";
		case global.tipos_hab[6]:
			return "Aumente a quantidade de energia ganha por acerto durante 10 segundos";
		default:
			return "A habilidade de tipo " + string(_hab.tipo) + " não tem uma descrição configurada.";
	}
}