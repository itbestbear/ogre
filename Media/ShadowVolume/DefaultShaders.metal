struct RasterizerData
{
  float4 pos [[position]];
  float4 col;
};

struct Vertex
{
  float3 pos [[ attribute(0) ]];
  float2 uv [[ attribute(7) ]];
};

vertex RasterizerData default_vp(Vertex in [[stage_in]])
{
  RasterizerData out;
  out.pos = float4(in.pos, 1);
  out.col = float4(in.uv,1,1);
  return out;
}

fragment half4 default_fp(RasterizerData in [[stage_in]],
                          metal::texture2d<half> tex [[texture(0)]],
                          metal::sampler s [[sampler(0)]])
{
  return tex.sample(s, in.col.xy);
}