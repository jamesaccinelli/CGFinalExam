Shader "Custom/OutlineWNormalMap"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
        _BumpTex("Normal Map", 2D) = "white" {}
        _mySlider("Bump Amount", Range(0,15)) = 1

        _OutlineColor("Outline Color", Color) = (0,0,0,1)
        _Outline("Outline Width", Range(0, 0.07)) = 0.005
    }
        SubShader
        {
            ZWrite Off
            CGPROGRAM
            #pragma surface surf Lambert vertex:vert

        struct Input
        {
            float2 uv_MainTex;

        };
        sampler2D _MainTex;

        float _Outline;
        float4 _OutlineColor;


        void vert(inout appdata_full v)
        {
            v.vertex.xyz += v.normal * _Outline;
        }

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Emission = _OutlineColor.rgb;
        }
        ENDCG

            ZWrite On
            CGPROGRAM
            #pragma surface surf Lambert

            struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpTex;
        };
        sampler2D _MainTex;
        sampler2D _BumpTex;
        half _mySlider;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex)); //rgb to xyz
            o.Normal *= float3(_mySlider, _mySlider, 1);
        }
        ENDCG
        }
            FallBack "Diffuse"
}
