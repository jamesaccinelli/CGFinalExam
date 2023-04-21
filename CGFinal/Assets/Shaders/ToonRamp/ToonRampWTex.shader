Shader "Custom/ToonRampWTex"
{
    Properties
    {
        _Colour("Colour", Color) = (1,1,1,1)
        _RampTex("Ramp Texture", 2D) = "white" {}
        _MainTex("Main Texture", 2D) = "white" {}
        _myBump("Bump Texture", 2D) = "bump" {}
        _mySlider("Bump Amount", Range(0,10)) = 1

       // _RimColor("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
       // _RimPower("Rim Power", Range(0, 8.0)) = 3.0
    }
        SubShader
        {

            CGPROGRAM
            #pragma surface surf ToonRamp

            float4 _Colour;
            sampler2D _RampTex;
            sampler2D _MainTex;
            sampler2D _myBump;
            half _mySlider;
           // float4 _RimColor;
           // float _RimPower;

            float4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed atten)
            {
                float diff = dot(s.Normal, lightDir);
                float h = diff * 0.5 + 0.5;
                float2 rh = h;
                float3 ramp = tex2D(_RampTex, rh).rgb;

                float4 c;
                c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
                c.a = s.Alpha;
                return c;

            }

            struct Input
            {
                float2 uv_MainTex;
                float2 uv_myBump;
                float3 viewDir;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Colour.rgb;
                o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)); //rgb to xyz
                o.Normal *= float3(_mySlider, _mySlider, 1);
                // half rim = dot (normalize(IN.viewDir), o.Normal);
               // half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
                //o.Emission = _RimColor.rgb * rim;
               // o.Emission = _RimColor.rgb * pow(rim, _RimPower);
            }
                ENDCG
        }
            FallBack "Diffuse"
}
