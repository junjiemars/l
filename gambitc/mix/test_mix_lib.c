#include <stdio.h>

#define _unused_(x) ((void)(x))

extern int power_of_2(int);

int
main(int argc, char **argv) {
  _unused_(argc);
  _unused_(argv);

  int n = 0;
  if (argc > 1) {
    sscanf(argv[1], "%i", &n);
  }
  
  printf("power_of_2(%i) = %i\n", n, power_of_2(n));

  return 0;
}
