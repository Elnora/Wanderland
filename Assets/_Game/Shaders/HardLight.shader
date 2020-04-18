// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "HardLight"
{
	Properties
	{
		_MainTex("_MainTex", 2D) = "white" {}
		_Color02("Color02", Color) = (1,0.2877358,0.2877358,0)
		_Color01("Color01", Color) = (0.2783019,0.453029,1,0)
		_Speed("Speed", Float) = 0
		_Offset("Offset", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform float4 _Color01;
		uniform float4 _Color02;
		uniform float _Speed;
		uniform float _Offset;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 blendOpSrc5 = _Color02;
			float4 blendOpDest5 = ( ( (_SinTime.z*_Speed + _Offset) * tex2D( _MainTex, uv_MainTex ) ) * i.vertexColor );
			float4 lerpResult17 = lerp( _Color01 , ( saturate(  (( blendOpSrc5 > 0.5 ) ? ( 1.0 - ( 1.0 - 2.0 * ( blendOpSrc5 - 0.5 ) ) * ( 1.0 - blendOpDest5 ) ) : ( 2.0 * blendOpSrc5 * blendOpDest5 ) ) )) , i.uv_texcoord.y);
			o.Emission = lerpResult17.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17000
2042;134;1371;798;1481.187;890.6592;1.26;True;False
Node;AmplifyShaderEditor.RangedFloatNode;28;-753.518,-342.0397;Float;False;Property;_Offset;Offset;5;0;Create;True;0;0;False;0;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;36;-750.3864,-652.519;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;30;-805.5892,-463.5893;Float;False;Property;_Speed;Speed;4;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-678.0408,-152.2798;Float;True;Property;_MainTex;_MainTex;0;0;Create;True;0;0;False;0;fa4a397ac1374fc448ed378c2dcc922c;fa4a397ac1374fc448ed378c2dcc922c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScaleAndOffsetNode;26;-468.6272,-452.0392;Float;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;4;-437,106;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-171.6744,-227.9299;Float;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;50,40;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;3;113,-181;Float;False;Property;_Color02;Color02;2;0;Create;True;0;0;False;0;1,0.2877358,0.2877358,0;0.2862746,0.8611617,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;9;1005.96,424.3799;Float;False;Property;_Color01;Color01;3;0;Create;True;0;0;False;0;0.2783019,0.453029,1,0;1,0.8986181,0.4858491,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendOpsNode;5;466.49,72;Float;True;HardLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;840.4587,195.9001;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;17;1247.172,40.25048;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SwitchNode;33;11.01284,-724.7203;Float;True;0;2;8;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1625.863,-79.83176;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;HardLight;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;TransparentCutout;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;26;0;36;3
WireConnection;26;1;30;0
WireConnection;26;2;28;0
WireConnection;18;0;26;0
WireConnection;18;1;1;0
WireConnection;2;0;18;0
WireConnection;2;1;4;0
WireConnection;5;0;3;0
WireConnection;5;1;2;0
WireConnection;17;0;9;0
WireConnection;17;1;5;0
WireConnection;17;2;6;2
WireConnection;0;2;17;0
ASEEND*/
//CHKSM=1903644580212220464DF93B67F3F0BC7CD888C0