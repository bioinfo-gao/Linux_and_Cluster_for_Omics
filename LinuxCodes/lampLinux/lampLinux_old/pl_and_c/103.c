#include <stdio.h>   
#include <stdlib.h>
#include <time.h>
int main(void)
{
  FILE *fp_out;            
  int i, n, c;
  fp_out = fopen("numbers", "w");    /* new file to be written , 
                                     wipes out anything was there,
                                     file name followed by file attribute */
  if( fp_out == NULL ) {
	printf(" Failed to open file numbers to write.\n" );
	exit ( 1 );
	}
  srand(time(NULL));
  for(i=0; i<10; i++)
  { c=i%10;
if(c=0)  fprintf(fp_out, "%8d", n); 
    n= rand()%1000 + 1;
   fprintf(fp_out, "%8d", n); /* just like printf, but to file out*/
  }
    fclose(fp_out);      /* closes files, saves it, makes it inaccessible */
  return 0;
}

