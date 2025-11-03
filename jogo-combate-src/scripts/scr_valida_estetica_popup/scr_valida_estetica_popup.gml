/// @function scr_valida_estetica_popup(estetica_struct)
/// @description Verifica se o struct de estética contém apenas as propriedades esperadas.
/// Ajuda a evitar que o usuário passe chaves incorretas no struct opcional.
/// @param {Struct} _struct O struct de estética opcional (options) passado para a função principal.
function scr_valida_estetica_popup(_struct) {
    var _mapa_validos = {
        fundo_cor: true, 
        texto_cores: true, 
        fontes: true, 
        largura: true, 
        altura: true
    };
    
    var _propriedades = variable_struct_get_names(_struct);
    
    for (var i = 0; i < array_length(_propriedades); i++) {
        var _nome = _propriedades[i];
       
        if (!variable_struct_exists(_mapa_validos, _nome)) {
             show_error("Propriedade de estética '" + _nome + "' não é válida. O struct de opções deve conter apenas chaves de estilo válidas.", true);
        }
    }
}