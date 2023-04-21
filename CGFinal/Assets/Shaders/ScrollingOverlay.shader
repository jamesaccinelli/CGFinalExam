Shader "Custom/ScrollingOverlay"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _FoamTex("Foam", 2D) = "white" {}
        _ScrollX("Scroll X", Range(-5,5)) = 1
        _ScrollY("Scroll Y", Range(-5,5)) = 1

        _Colour("Colour", Color) = (1,1,1,1)
    }
        SubShader
        {
            CGPROGRAM

            #pragma surface surf Lambert

            float _ScrollX;
            float _ScrollY;
            sampler2D _MainTex;
            sampler2D _FoamTex;
            float4 _Colour;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            _ScrollX *= _Time;
            _ScrollY *= _Time;

            float3 water = (tex2D(_MainTex, IN.uv_MainTex + float2(_ScrollX, _ScrollY)));
            float3 foam = (tex2D(_FoamTex, IN.uv_MainTex + float2(_ScrollX / 2.0, _ScrollY / 2.0)));
            o.Albedo = (water + foam) / 2.0 * _Colour;
        }
        ENDCG
        }
            FallBack "Diffuse"
}
