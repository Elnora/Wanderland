// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ASE/Gradient"
{
	Properties
	{
		_TopPower("TopPower", Float) = 1.27
		_TopPos("TopPos", Float) = -0.68
		_BottomPos("BottomPos", Float) = -0.43
		_Top("Top", Color) = (1,0,0,0)
		_Bottom("Bottom", Color) = (1,0.9735684,0,0)
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

		uniform float4 _Top;
		uniform float _TopPower;
		uniform float _BottomPos;
		uniform float _TopPos;
		uniform float4 _Bottom;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 temp_cast_0 = (_BottomPos).xx;
			float2 uv_TexCoord2 = i.uv_texcoord + temp_cast_0;
			float4 clampResult36 = clamp( ( _Top * ( _TopPower * uv_TexCoord2.y ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float2 temp_cast_1 = (_TopPos).xx;
			float2 uv_TexCoord12 = i.uv_texcoord + temp_cast_1;
			float4 clampResult37 = clamp( ( ( -2.37 * uv_TexCoord12.y ) * _Bottom ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 color39 = IsGammaSpace() ? float4(0.6320754,0.6320754,0.6320754,0) : float4(0.3572768,0.3572768,0.3572768,0);
			float4 lerpResult38 = lerp( clampResult36 , clampResult37 , color39);
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
287;80;1182;865;1533.25;681.6246;1.874999;True;False
Node;AmplifyShaderEditor.RangedFloatNode;13;-1417,417.1872;Float;False;Property;_TopPos;TopPos;2;0;Create;True;0;0;False;0;-0.68;-0.14;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1433.875,94.68727;Float;False;Property;_BottomPos;BottomPos;4;0;Create;True;0;0;False;0;-0.43;-0.43;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1202,77.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;-0.69,-0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-1199.5,379.6873;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;3;-921.5,93.87498;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;17;-944.5006,419.0623;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;31;-878.8754,303.6873;Float;False;Constant;_BottomPower;BottomPower;5;0;Create;True;0;0;False;0;-2.37;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-951.9998,-54.37489;Float;False;Property;_TopPower;TopPower;0;0;Create;True;0;0;False;0;1.27;1.27;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;32;-517.0004,678.6871;Float;False;Property;_Bottom;Bottom;6;0;Create;True;0;0;False;0;1,0.9735684,0,0;1,0.9735684,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;20;-588.2507,-119.0625;Float;False;Property;_Top;Top;5;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-597.6257,383.4373;Float;True;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-620.1249,78.74995;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-245.1255,73.06235;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-224.5006,378.6873;Float;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;36;84.87439,101.1873;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;37;96.12428,380.5622;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;39;289.2493,626.1872;Float;False;Constant;_Color2;Color 2;5;0;Create;True;0;0;False;0;0.6320754,0.6320754,0.6320754,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;38;527.3743,254.9373;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;41;660.4995,511.8122;Float;False;Constant;_Float0;Float 0;5;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;831.124,209.9373;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1;963.6246,-272;Float;False;Property;_TopColor;TopColor;1;0;Create;True;0;0;False;0;0.5801887,0.9504031,1,0;0.5801887,0.9504031,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;872.3748,-46.875;Float;False;Property;_BottomColor;BottomColor;3;0;Create;True;0;0;False;0;0,0.2954388,1,0;0,0.2941177,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;43;1091.749,189.3123;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;10;1626,-330.5;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;ASE/Gradient;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;1;11;0
WireConnection;12;1;13;0
WireConnection;3;0;2;0
WireConnection;17;0;12;0
WireConnection;15;0;31;0
WireConnection;15;1;17;1
WireConnection;5;0;6;0
WireConnection;5;1;3;1
WireConnection;29;0;20;0
WireConnection;29;1;5;0
WireConnection;30;0;15;0
WireConnection;30;1;32;0
WireConnection;36;0;29;0
WireConnection;37;0;30;0
WireConnection;38;0;36;0
WireConnection;38;1;37;0
WireConnection;38;2;39;0
WireConnection;40;0;38;0
WireConnection;40;1;41;0
WireConnection;43;0;40;0
WireConnection;10;2;43;0
ASEEND*/
//CHKSM=D18407FADD42B00D79D355582B4802A23CC0ED99