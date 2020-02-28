// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ASE/Gradient"
{
	Properties
	{
		_TopColor("TopColor", Color) = (1,0,0,0)
		_BottomPosition("BottomPosition", Float) = -0.68
		_BottomColor("BottomColor", Color) = (1,0.9735684,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _TopColor;
		uniform float4 _BottomColor;
		uniform float _BottomPosition;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 temp_cast_0 = (_BottomPosition).xx;
			float2 uv_TexCoord12 = i.uv_texcoord + temp_cast_0;
			float4 lerpResult38 = lerp( _TopColor , _BottomColor , ( ( 1.0 - uv_TexCoord12.y ) * _BottomColor ));
			float4 clampResult43 = clamp( ( lerpResult38 * 5.0 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			o.Emission = clampResult43.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17000
-1920;0;1920;1019;770.4853;315.3856;1.274999;True;False
Node;AmplifyShaderEditor.RangedFloatNode;13;-1484.724,414.0373;Float;False;Property;_BottomPosition;BottomPosition;2;0;Create;True;0;0;False;0;-0.68;0.31;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-1199.5,379.6873;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;46;-897.9863,433.039;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;32;-970.8256,601.3627;Float;False;Property;_BottomColor;BottomColor;3;0;Create;True;0;0;False;0;1,0.9735684,0,0;1,0.9463062,0.4292453,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;20;-941.4264,209.8874;Float;False;Property;_TopColor;TopColor;1;0;Create;True;0;0;False;0;1,0,0,0;0,0.9523807,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-623.0504,435.8625;Float;True;2;2;0;FLOAT;1;False;1;COLOR;-1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;41;437.3745,687.7618;Float;False;Constant;_Float0;Float 0;5;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;38;-76.97498,339.0871;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;695.9737,489.162;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-931.6994,63.47499;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;-0.69,-0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;43;1010.149,436.6621;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-599.7244,83.84995;Float;True;2;2;0;FLOAT;0;False;1;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1182.7,99.78728;Float;False;Property;_TopPosition;TopPosition;0;0;Create;True;0;0;False;0;-0.43;-0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;10;1410.524,369.4745;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;ASE/Gradient;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;12;1;13;0
WireConnection;46;0;12;2
WireConnection;15;0;46;0
WireConnection;15;1;32;0
WireConnection;38;0;20;0
WireConnection;38;1;32;0
WireConnection;38;2;15;0
WireConnection;40;0;38;0
WireConnection;40;1;41;0
WireConnection;2;1;11;0
WireConnection;43;0;40;0
WireConnection;5;0;2;2
WireConnection;5;1;20;0
WireConnection;10;2;43;0
ASEEND*/
//CHKSM=81354B75ADB4752DDA5A57FA5F2481B4BF7BF6B0