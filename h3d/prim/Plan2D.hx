package h3d.prim;

class Plan2D extends Primitive {

	function new() {
	}
	
	override function triCount() {
		return 2;
	}
	
	override function vertexCount() {
		return 4;
	}

	override function alloc( engine : h3d.Engine ) {
		var v = new hxd.FloatBuffer();
		v.push( -1);
		v.push( -1);
		v.push( 0);
		v.push( 1);

		v.push( -1);
		v.push( 1);
		v.push( 0);
		v.push( 0);

		v.push( 1);
		v.push( -1);
		v.push( 1);
		v.push( 1);

		v.push( 1);
		v.push( 1);
		v.push( 1);
		v.push( 0);

		buffer = h3d.Buffer.ofFloats(v, 4, [Quads, RawFormat]);
	}

	override function render(engine:h3d.Engine) {
		if( buffer == null || buffer.isDisposed() ) alloc(engine);
		engine.renderQuadBuffer(buffer);
	}

	static var inst = null;
	public static function get() {
		if( inst == null ) inst = new Plan2D();
		return inst;
	}

}