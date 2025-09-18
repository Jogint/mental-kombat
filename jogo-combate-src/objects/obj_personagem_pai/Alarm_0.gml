/// @description Timer bot
var _chance_acerto = irandom_range(1, 100);

if (global.dificuldade == global.dificuldades[2]) {
	scr_acerto_bot(self, _chance_acerto, 70);
} else if (global.dificuldade == global.dificuldades[1]) {
	scr_acerto_bot(self, _chance_acerto, 50);
} else {
	scr_acerto_bot(self, _chance_acerto, 30);
}