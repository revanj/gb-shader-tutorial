shader_type spatial;

void vertex() {
	VERTEX.y += cos(VERTEX.x + TIME) * sin(VERTEX.z * 2.0 - TIME);
}
