#version 330 core
in vec3 ourColor;
in vec2 TexCoord;

out vec4 color;

uniform sampler2D ourTexture1;
uniform sampler2D ourTexture2;

uniform float alpha;

void main()
{
	// Original
    //color = mix(texture(ourTexture1, TexCoord), texture(ourTexture2, TexCoord), 0.2); 
    
    // EX.1
    //vec2 tmpTexCoord = vec2(TexCoord.x, 1.0f - TexCoord.y);
    //color = mix(texture(ourTexture1, TexCoord), texture(ourTexture2, tmpTexCoord), 0.2);;
    
    // EX.4
    vec2 tmpTexCoord = vec2(TexCoord.x, 1.0f - TexCoord.y);
    color = mix(texture(ourTexture1, TexCoord), texture(ourTexture2, tmpTexCoord), alpha);
    
}
