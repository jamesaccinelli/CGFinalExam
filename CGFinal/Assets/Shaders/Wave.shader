Shader "Custom/Wave"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _Tint("Colour Tint", Color) = (1,1,1,1)
        _Freq("V", Range(0,5)) = 3
        _Speed("M", Range(0,100)) = 10
        _Amp("Z", Range(0,1)) = 0.5

        _FoamTex("Foam", 2D) = "white" {}
        _ScrollX("Scroll X", Range(-5,5)) = 1
        _ScrollY("Scroll Y", Range(-5,5)) = 1

        _myBump("Bump Texture", 2D) = "bump" {}
       _mySlider("Bump Amount", Range(0,15)) = 1
    }
        SubShader
       {
           CGPROGRAM
           #pragma surface surf Lambert vertex:vert

           struct Input
           {
               float2 uv_MainTex;
               float3 vertColor;
               float2 uv_myBump;
           };

           float4 _Tint;
           float _Freq;
           float _Speed;
           float _Amp;

           float _ScrollX;
           float _ScrollY;

           half _mySlider;

           sampler2D _FoamTex;

           struct appdata {
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 texcoord: TEXCOORD0;
               float4 texcoord1: TEXCOORD1;
               float4 texcoord2: TEXCOORD2;
               float4 tangent : TANGENT;
           };

           void vert(inout appdata v, out Input o) {
               UNITY_INITIALIZE_OUTPUT(Input,o);

               float t = _Time * _Speed; // _Time = unity variable
               float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp + sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp;
               v.vertex.y = v.vertex.y + waveHeight;
               v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
               o.vertColor = waveHeight + 2; // makes top brighter, bottom of wave darker
           }

           sampler2D _MainTex;
           sampler2D _myBump;
           void surf(Input IN, inout SurfaceOutput o) {

               _ScrollX *= _Time;
               _ScrollY *= _Time;

               float3 water = (tex2D(_MainTex, IN.uv_MainTex + float2(_ScrollX, _ScrollY)));
               float3 foam = (tex2D(_FoamTex, IN.uv_MainTex + float2(_ScrollX / 2.0, _ScrollY / 2.0)));

               o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)); //rgb to xyz
               o.Normal *= float3(_mySlider, _mySlider, 1);

               o.Albedo = (water + foam) / 2.0 * _Tint * IN.vertColor.rgb;

               float4 c = tex2D(_MainTex, IN.uv_MainTex);
               //o.Albedo = c * IN.vertColor.rgb;
           }
           ENDCG
       }
           FallBack "Diffuse"
}
