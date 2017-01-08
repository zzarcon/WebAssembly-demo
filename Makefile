default: standalone

standalone:
	emcc palindrome.c -Os -s WASM=1 -s SIDE_MODULE=1 -o palindrome.wasm

full:
	emcc palindrome.c -s WASM=1 -s EXPORTED_FUNCTIONS="['_isPalindrome', '_main']" -o full.html