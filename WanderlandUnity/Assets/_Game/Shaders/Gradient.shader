// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ASE/Gradient"
{
	Properties
	{
		_ColorBottom("Color Bottom", Color) = (1,0,0,0)
		_ColorTop("Color Top", Color) = (1,0.9735684,0,0)
		_GradientPosition("Gradient Position", Float) = 0
		_GradientSpread("Gradient Spread", Float) = 0
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

		uniform float4 _ColorBottom;
		uniform float4 _ColorTop;
		uniform float _GradientPosition;
		uniform float _GradientSpread;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 temp_cast_0 = (_GradientPosition).xx;
			float2 temp_cast_1 = (_GradientSpread).xx;
			float2 uv_TexCoord47 = i.uv_texcoord * temp_cast_0 + temp_cast_1;
			float4 lerpResult48 = lerp( _ColorBottom , _ColorTop , uv_TexCoord47.y);
			o.Emission = lerpResult48.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17000
-1920;0;1920;1019;623.9973;296.6748;1.754997;True;False
Node;AmplifyShaderEditor.RangedFloatNode;51;506.6306,854.6034;Float;False;Property;_GradientSpread;Gradient Spread;3;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;49;455.7356,740.5285;Float;False;Property;_GradientPosition;Gradient Position;2;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;47;743.2278,697.5148;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;20;698.529,107.4324;Float;False;Property;_ColorBottom;Color Bottom;0;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;32;600.5187,405.9587;Float;False;Property;_ColorTop;Color Top;1;0;Create;True;0;0;False;0;1,0.9735684,0,0;1,0.9735684,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;48;1135.413,593.0898;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;10;1625.524,365.1745;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;ASE/Gradient;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;47;0;49;0
WireConnection;47;1;51;0
WireConnection;48;0;20;0
WireConnection;48;1;32;0
WireConnection;48;2;47;2
WireConnection;10;2;48;0
ASEEND*/
//CHKSM=305084A0D78D607707F27F1D69B0F3573169A3B6