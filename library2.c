#include "lib.h"
#include "lib2.h"
#include <stdio.h>

void show_decorated_one() {
  int value = return_one();
  printf("======== %d =======\n", value);
}
