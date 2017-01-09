#include <stdio.h>
#include <stdbool.h>
#include <string.h>
// #include <stdint.h>
// #include <limits.h>

bool isPalindrome(char* str) {
  size_t len = strlen(str);
  int half = len / 2;
  int start = 0;
  int end = len - 1;
  int space = 32;
  int comma = 44;
  bool isPal = true;
  bool startSpace;
  bool endSpace;
  
  // printf("str %s\n", str);
  // printf("len %zu\n", len);

  while (half > 0 && isPal) {
    startSpace = str[start] == space || str[start] == comma;
    endSpace = str[end] == space || str[end] == comma;

    if (str[start] == str[end]) {
      start++;
      end--;
    } else if (startSpace || endSpace) {
      startSpace && start++;
      endSpace && end--;
    } else {
      isPal = false;
    }

    half--;
  }

  return isPal;  
}

// int main(int argc, char ** argv) {
//   int result = isPalindrome("aba");
//   // size_t len = strlen("hector");

//   printf(result ? "true" : "false");
// }