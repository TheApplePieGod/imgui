#version 450 core
layout(location = 0) in vec2 aPos;
layout(location = 1) in vec2 aUV;
layout(location = 2) in vec4 aColor;

layout(push_constant) uniform uPushConstant {
    vec2 uScale;
    vec2 uTranslate;
} pc;

out gl_PerVertex {
    vec4 gl_Position;
};

layout(location = 0) out struct {
    vec4 Color;
    vec2 UV;
} Out;

void main()
{
    bvec4 cutoff = lessThan(aColor, vec4(0.0031308));
    vec4 higher = vec4(1.055)*pow(aColor, vec4(1.0/2.4)) - vec4(0.055);
    vec4 lower = aColor * vec4(12.92);
    Out.Color = mix(higher, lower, cutoff);

    //Out.Color = aColor;
    Out.UV = aUV;
    gl_Position = vec4(aPos * pc.uScale + pc.uTranslate, 0, 1);
}
