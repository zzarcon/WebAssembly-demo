default: standalone

standalone:
	emcc palindrome.c -v -Os -s WASM=1 -s SIDE_MODULE=1 -o palindrome.wasm

fibo:
	emcc fibonacci.c -Os -s WASM=1 -s SIDE_MODULE=1 -o fibonacci.wasm

full:
	emcc palindrome.c -v -s WASM=1 -s EXPORTED_FUNCTIONS="['_isPalindrome', '_main']" -o full.html