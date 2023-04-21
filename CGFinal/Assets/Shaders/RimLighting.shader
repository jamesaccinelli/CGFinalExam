Shader "Custom/RimLighting"
{
    Properties
    {
        _RimColor("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
        _RimPower("Rim Power", Range(0.5, 8.0)) = 3.0

        _myDiffuse("Diffuse Texture", 2D) = "white" {}
       _myBump("Bump Texture", 2D) = "bump" {}
       _mySlider("Bump Amount", Range(0,15)) = 1
        _Color("Colour", Color) = (1,1,1,1)
    }
        SubShader
       {
           Tags { "RenderType" = "Opaque" }

           CGPROGRAM

           #pragma surface surf Lambert    

           struct Input
           {
               float3 viewDir;
               float2 uv_myDiffuse;
               float2 uv_myBump;
           };

           float4 _RimColor;
           float _RimPower;

           sampler2D _myDiffuse;
           sampler2D _myBump;
           half _mySlider;
           float4 _Color;

           void surf(Input IN, inout SurfaceOutput o)
           {
               // half rim = dot (normalize(IN.viewDir), o.Normal);
               half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
               //o.Emission = _RimColor.rgb * rim;
               o.Emission = _RimColor.rgb * pow(rim, _RimPower);
               o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb * _Color;
               o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)); //rgb to xyz
               o.Normal *= float3(_mySlider, _mySlider, 1);
           }
           ENDCG
       }
           FallBack "Diffuse"
}
