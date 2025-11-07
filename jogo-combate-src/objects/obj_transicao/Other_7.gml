/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (room = rm_selecao_personagem) {
	sprite_index = spr_transicao_1;
	room_goto_next();
} else if (room == rm_combate) {
	instance_destroy();
}