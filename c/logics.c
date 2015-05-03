/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 Chew, Kean Ho <hollowaykeanho@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>

#define SUCCESS			0
#define FAILURE			1

int main(void)
{
	int i;
	int a = 50;

	/* if else with 1 line of code each */
	if (a == 40)
		printf("Something wrong with the compiler\n");
	else if (a == 30)
		printf("Something serious wrong with this compiler\n");
	else
		printf("This is the way\n");

	/* if else with more line of code for any each */
	if (a == 40) {
		printf("Something wrong with the compiler\n");
		printf("You should fix your compiler\n");
	} else if (a == 30) {
		printf("Something seriously went wrong with your compiler\n");
	} else {
		printf("This is the correct way\n");
	}

	/* Switch cases */
	switch(a) {
	case 10:	/* case 10 to continue operate with case 20 */
	case 20:
		break;
	case 30:
		break;
	default:
		break;
	}

	/* For loop */
	for (i = 0; i < 10; i++) {
		/*Do something with i as index */
	}

	/* For loop with custom increments */
	for (i = 0; i < 10; i += 2) {
		/* Do something with i as index */
	}

	/* While loop */
	while (i < 50) {
		/* Do something until the condition breaks */
		i++;
	}

	return SUCCESS;
}
