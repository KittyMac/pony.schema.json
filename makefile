all:
	stable env /Volumes/Development/Development/pony/ponyc/build/release/ponyc -o ./build/ ./schema_json
	time ./build/schema_json

test:
	stable env /Volumes/Development/Development/pony/ponyc/build/release/ponyc -V=0 -o ./build/ ./schema_json
	./build/schema_json