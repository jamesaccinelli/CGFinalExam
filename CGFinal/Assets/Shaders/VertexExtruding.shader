Shader "Custom/VertexExtruding"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _Amount("Extrude", Range(0,0.1)) = 0.0

       _myBump("Bump Texture", 2D) = "bump" {}
       _mySlider("Bump Amount", Range(0,15)) = 1
    }

        SubShader
       {
           Tags { "RenderType" = "Opaque" }

           CGPROGRAM
           //#pragma surface surf Lambert
           #pragma surface surf Lambert vertex:vert

           sampler2D _MainTex;
           float _Amount;

           sampler2D _myBump;
           half _mySlider;

           struct Input
           {
               float2 uv_MainTex;
               float2 uv_myBump;
           };


           struct appdata
           {
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 texcoord : TEXCOORD0;
               float4 tangent : TANGENT;
           };

           void vert(inout appdata v)
           {
               v.vertex.xyz += v.normal * _Amount;
           }


           void surf(Input IN, inout SurfaceOutput o)
           {
               o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
               o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)); //rgb to xyz
               o.Normal *= float3(_mySlider, _mySlider, 1);
           }
           ENDCG
       }
           FallBack "Diffuse"
}
