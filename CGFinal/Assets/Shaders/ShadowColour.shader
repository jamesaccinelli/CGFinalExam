Shader "Custom/ShadowColour"
{
    Properties
    {
         _Color("Main Color", Color) = (1,1,1,1)
         _MainTex("Base (RGB)", 2D) = "white" {}
         _myBump("Bump Texture", 2D) = "bump" {}
         _mySlider("Bump Amount", Range(0, 15)) = 1
         _ShadowColor("Shadow Color", Color) = (1,1,1,1)
         _ShadowAmount("Shadow Amount", Range(0,2)) = 1

    }
        SubShader
         {
                 Tags {"RenderType" = "Opaque"}
                 CGPROGRAM

                 #pragma surface surf CSLambert
                 sampler2D _MainTex;
                 fixed4 _Color;
                 fixed4 _ShadowColor;
                 sampler2D _myBump;
                 half _mySlider;
                 half _ShadowAmount;

                 struct Input
                 {
                     float2 uv_MainTex;
                     float2 uv_myBump;
                 };

                 half4 LightingCSLambert(SurfaceOutput s, half3 lightDir, half atten)
                 {
                     fixed diff = max(0, dot(s.Normal, lightDir));
                     half4 c;
                     c.rgb = s.Albedo * _LightColor0.rgb * (diff * atten * 0.5);
                     //shadow color
                     c.rgb += _ShadowColor.xyz * (1.0 - atten) * _ShadowAmount;
                     c.a = s.Alpha;
                     return c;
                 }

                 void surf(Input IN, inout SurfaceOutput o)
                 {
                     half4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
                     o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)); //rgb to xyz
                     o.Normal *= float3(_mySlider, _mySlider, 1);
                     o.Albedo = c.rgb;
                     o.Alpha = c.a;
                 }
                 ENDCG
         }
             Fallback "Diffuse"
}
