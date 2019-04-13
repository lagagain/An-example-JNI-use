ALL += output/Main.class output/libhello.so

all: ${ALL}

output:
	mkdir output

output/Main.class: output
	javac -d output src/Main.java

output/libhello.so: output src/ src/Main.h src/hello.c
	gcc -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux src/hello.c -o output/libhello.so --share -fPIC

src/Main.h: output/Main.class
	# javah -cp output -d src -jni Main # old version
	javac -h src -d output src/Main.java

clean:
	rm -rf ${ALL}
	rm -f src/Main.h
	rm -rf output

run: all
	echo "Prepare to run program"
	echo ""
	echo ""
	LD_LIBRARY_PATH=`pwd`/output java -cp output Main
