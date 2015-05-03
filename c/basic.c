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

/************************************************
 * Include Locals				*
 ************************************************/
#include <stdio.h>

/************************************************
 * #Define Macro				*
 ************************************************/
#define SUCCESS			0
#define FAILURE			1

/************************************************
 * Making Comments				*
 ************************************************/
// Avoid using this commenting type for compiler standards

/* This is how you make a very long
 * and very long comment
 */

/************************************************
 * Declare vs. Define				*
 ************************************************/
static int declare_but_not_defined;
static int declare_and_defined = 0;

/************************************************
 * Variable Types				*
 ************************************************/
/* Unsigned Integer, Max Value = 255, 8 bits */
unsigned int integer = 255;

/* Unsigned Short, Max Value = 65535, 16 bits */
unsigned short short_number = 0xFFFF;

/* Unsigned Long, Max Value = 32 bits */
unsigned long long_number = 0xFFFFFFFF;

/* Unsigned Long Long, Max Value = 64 bits */
unsigned long long very_long_number = 0xFFFFFFFFFFFFFFFF;

/* Unsigned Single Character */
char character = 'a';

/* Unsigned String */
char *strings = "I'm a string!";

/* Pointer Variables */
int *pointer;


/************************************************
 * Basic Main Function. 1 Program should have 1 *
 ************************************************/
int main(void)
{
	printf("integer=0x%x\n", integer);
	printf("short=0x%x\n", short_number);
	printf("long=0x%lx\n", long_number);
	printf("long=0x%llx\n", very_long_number);
	printf("character=%c\n", character);
	printf("strings=%s\n", strings);
	return SUCCESS;
}
