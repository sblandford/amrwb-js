.PHONY: all clean

#all: amrwb.js amrnb.js
all: amrwb.js

amrwb.js: amrwb.bc
	em++ amrwb.bc -O3 -s ASSERTIONS=1 -s NO_EXIT_RUNTIME=1 -s TOTAL_MEMORY=16777216 -s TOTAL_STACK=65536 -s \
		EXPORTED_FUNCTIONS="['_D_IF_init','_D_IF_exit','_D_IF_decode']" \
		 --pre-js pre.js --post-js post.js --memory-init-file 0 -o $@


amrwb.bc: bldwb.sh
	./bldwb.sh
	
clean:
	rm -rf build
	rm -f amrwb.*

