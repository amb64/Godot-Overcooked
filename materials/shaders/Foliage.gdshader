shader_type spatial;
render_mode cull_disabled, depth_draw_opaque, depth_prepass_alpha;

uniform sampler2D grass_texture : filter_nearest, source_color;

void vertex(){
	NORMAL = vec3(0.0, 0.5, 0.0);
	VERTEX.x += sin(NODE_POSITION_WORLD.x + TIME * 1.0 + UV.y) * ( 1.0 - UV.y) * 0.3;
	VERTEX.z += cos(NODE_POSITION_WORLD.z + TIME * 0.45 + UV.y) * ( 1.0 - UV.y) * 0.3;
}

void fragment(){
	ALBEDO = texture(grass_texture, UV).rgb;
	ALPHA = texture(grass_texture, UV).a;
	ROUGHNESS = 1.0;
}