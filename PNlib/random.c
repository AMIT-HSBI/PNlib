#include <stdlib.h>
#ifndef RANDOM_C
#define RANDOM_C
int random()
{
   static int called=0;
   int i;
   if (!called) {
      srand((unsigned) time(NULL));
	  //for (i=1;i<500;i++) rand();
      called=1;
   }
   return rand();
}
#endif

