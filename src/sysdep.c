


/********************************************
 *                 WINDOWS                  *
 ********************************************/
#ifdef WINDOWS
#include <windows.h>
#include "larnfunc.h"


/*
 *  routine to take a nap for n milliseconds
 */
void nap(int x)
{

	/* eliminate chance for infinite loop */
	if (x <= 0) {

		return; 
	}
	
	lflush();
	
	Sleep(x);
}
#else

/********************************************
 *                 UNIX                     *
 ********************************************/

#include <unistd.h>
#include "larnfunc.h"


/*
 *  routine to take a nap for n milliseconds
 */
void nap(int x)
{

	/* eliminate chance for infinite loop */
	if (x <= 0) {

		return; 
	}
	
	lflush();
	
	usleep(x*1000);
}


#endif

