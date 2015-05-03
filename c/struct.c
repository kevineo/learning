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


/************************************************
 * Creating Stucture				*
 ************************************************/
struct a_sample_structure_type {
	char string[50];
	int integer_member;
};

struct bit_field_structure_type {
	unsigned int bit_1:1;
	unsigned int bit_2_3:2;
	unsigned int bit_4_5:2;
	unsigned int bit_6_7_8:3;
};

struct bit_field_structure_type demo_independent_structure = {
	.bit_1 = 0,
	.bit_2_3 = 1,
	.bit_4_5 = 1,
	.bit_6_7_8 = 2,
};

/************************************************
 * Demonstrate how to use struct		*
 ************************************************/
int main(void)
{
	struct bit_field_structure_type byte;
	struct bit_field_structure_type *pointer;

	pointer = &byte;

	/* Using member of struct if the struct is locally defined */
	byte.bit_1 = 0;
	byte.bit_2_3 = 0;
	byte.bit_4_5 = 0;
	byte.bit_6_7_8 = 5;

	printf("bit_6_7_8=0x%x\n", byte.bit_6_7_8);

	/* Using member of struct if the struct is a pointer type */
	pointer->bit_6_7_8 = 2;
	printf("bit_6_7_8=0x%x\n", byte.bit_6_7_8);

	pointer = &demo_independent_structure;
	printf("new pointer: bit_6_7_8 = 0x%x\n", pointer->bit_6_7_8);

	return SUCCESS;
}
