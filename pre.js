var AMRWB = (function() {
	var AMRWB = {};
	var Module = {
		canvas: {},
		print: function(text) {
			console.log(text);
		},
		onRuntimeInitialized: function() {
			AMRWB.D_IF_init = Module._D_IF_init;
			AMRWB.D_IF_exit = Module._D_IF_exit;
			AMRWB.D_IF_decode = Module._D_IF_decode;
			AMRWB._free = Module._free;
			AMRWB._HEAPU8 = Module.HEAPU8;
			AMRWB._malloc = Module._malloc;
			return 0;
		}
	};

 
