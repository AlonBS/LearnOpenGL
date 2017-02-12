

#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;

out vec3 ourColor;
out vec4 pos;

// EX.2
//uniform float offset;

void main()
{
	// EX.2
    //gl_Position = vec4(position.x + offset, position.y, position.z, 1.0f);
    gl_Position = vec4(position.xyz, 1.0f);
    pos = gl_Position;
    ourColor = color;
}

