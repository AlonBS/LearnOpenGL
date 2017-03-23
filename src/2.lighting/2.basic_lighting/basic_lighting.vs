

#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;


out vec4 vscolor;



uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
 
 
uniform vec3 lightPos; 
uniform vec3 viewPos;
uniform vec3 lightColor;
uniform vec3 objectColor;


void main()
{
	gl_Position = projection * view * model * vec4(position, 1.0f);
	
	vec3 FragPos = vec3 ( model * vec4(position, 1.0f));
	vec3 Normal = normalize( mat3(transpose(inverse(model))) * normal );


	// ambient 
    float ambient_factor = 0.1f;
    vec3 ambient = ambient_factor * lightColor;
    
    
    //diffuse
    float diffuse_factor = 1.0f;
    vec3 lightDir = normalize(lightPos - FragPos);
    float diff = max(dot(Normal, lightDir), 0.0f);
    vec3 diffuse = diffuse_factor * diff * lightColor;
    
    //specular
    float specular_factor = 1.0f;
    vec3 viewDir = normalize( viewPos - FragPos );
    vec3 reflectDir = normalize (reflect( -lightDir, Normal));
    float spec = pow(max(dot(viewDir, reflectDir), 0.0f), 264);
    vec3 specular = specular_factor * spec * lightColor;
        
    
    
    vscolor = vec4((ambient + diffuse + specular) * objectColor, 1.0f);
    
    
    
    
    
/*    
THIS IS A COMMENT    
    
     // Ambient
    float ambientStrength = 0.1f;
    vec3 ambient = ambientStrength * lightColor;
  	
    // Diffuse 
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(lightPos - FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;
    
    // Specular
    float specularStrength = 0.5f;
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);  
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32);
    vec3 specular = specularStrength * spec * lightColor;  
        
    vec3 result = (ambient + diffuse + specular) * objectColor;
    color = vec4(result, 1.0f);
*/      
} 


