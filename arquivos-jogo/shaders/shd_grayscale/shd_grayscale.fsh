// shd_grayscale.fragment
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // 1. Obtém a cor original do pixel da textura
    vec4 colour = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    // 2. Calcula a luminância (brilho)
    // Coeficientes comuns baseados na percepção humana de brilho:
    float gray_value = (colour.r * 0.299) + (colour.g * 0.587) + (colour.b * 0.114);
    
    // 3. Define a nova cor (R, G, B) usando o valor de luminância e mantém o Alpha
    gl_FragColor = vec4(gray_value, gray_value, gray_value, colour.a);
}