default: standalone

standalone:
	emcc palindrome.c -Os -s WASM=1 -s SIDE_MODULE=1 -o palindrome.wasm

full:
	emcc palindrome.c -s WASM=1 -o full.html