/// @description Inicia a música de fundo
audio_play_sound(snd_xdh_spoiler_inst, 10, true, 1.0, 7);

if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}