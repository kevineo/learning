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
#include <string.h>

#define SUCCESS			0
#define FAILURE			1


/************************************************
 * Creating Union				*
 ************************************************/
union union_type {
	unsigned int	a;
	float		f;
	char		str[20];
};

union union_type pointer_demo = {
	.a = 5,
	.f = 220.5,
	.str = "C Programming",
};

/************************************************
 * Demonstrate how to use union			*
 ************************************************/
int main(void)
{
	union union_type union_sample;
	union union_type *pointer;
	int a = 10;
	int *b;

	/* assigning value to sample union */
	strcpy(union_sample.str, "C Programming");
	printf("s = %s \n", union_sample.str);

	/* Using member of union through pointer type */
	pointer = &union_sample;
	b = &a;

	/* Access pointer's value via "->" */
	strcpy(pointer->str, "C-PROGRAMMING");
	printf("s = %s \n", pointer->str);
	printf("a - %d \n", *b);

	/* Assign value to pointer's element */
	pointer->a = 5;
	*b = 5;

	return SUCCESS;
}
