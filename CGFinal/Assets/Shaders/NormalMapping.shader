Shader "Custom/NormalMapping"
{
    Properties
    {
        _myDiffuse("Diffuse Texture", 2D) = "white" {}
       _myBump("Bump Texture", 2D) = "bump" {}
       _mySlider("Bump Amount", Range(0,15)) = 1
       _Colour("Colour", Color) = (1,1,1,1)
    }
        SubShader
       {

           CGPROGRAM
           #pragma surface surf Lambert
           sampler2D _myDiffuse;
           sampler2D _myBump;
           half _mySlider;
           float4 _Colour;

           struct Input
           {
               float2 uv_myDiffuse;
               float2 uv_myBump;
           };

           void surf(Input IN, inout SurfaceOutput o)
           {
               o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb * _Colour;
               o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)); //rgb to xyz
               o.Normal *= float3(_mySlider, _mySlider, 1);
           }
           ENDCG
       }
           FallBack "Diffuse"
}
