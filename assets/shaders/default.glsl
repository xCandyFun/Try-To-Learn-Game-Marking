    #type vertex
    #version 330 core
    layout (location=0) in vec3 aPos;
    layout (location=1) in vec4 aColor;
    layout (location=2) in vec2 aTexCoords;

    uniform mat4 uProjection;
    uniform mat4 uView;

    out vec4 fColor;
    out vec2 fTexCoords;

    void main(){
        fColor = aColor;
        fTexCoords = aTexCoords;
        gl_Position = uProjection * uView * vec4(aPos, 1.0);
    }

    #type fragment
    #version 330 core

    uniform float uTime;
    uniform sampler2D TEX_SAMPLER;

    in vec4 fColor;
    in vec2 fTexCoords;

    out vec4 color;

    void main(){
        //color = sin(uTime) * fColor;
        //float avg = (fColor.r + fColor.g + fColor.b) / 3;
        //color = vec4(avg, avg, avg, 1);
        //float noise = fract(sin(dot(fColor.xy, vec2(12.9898,78.233))) * 43758.5453);
        //color = fColor * noise;
        //color = fColor;
        color = texture(TEX_SAMPLER, fTexCoords);

    }