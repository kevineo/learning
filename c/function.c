//This is just a demo
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

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#define SUCCESS			0
#define FAILURE			1

/************************************************
 * Void Function				*
 ************************************************/
void function_void(void)
{
	return;
}


/************************************************
 * Value returning function			*
 ************************************************/
int function_int(void)
{
	return SUCCESS;
}

/************************************************
 * Function with Parameters			*
 ************************************************/
int function_with_param(int number, long data, char id)
{
	printf("%s: num=%d data=0x%lx id=%c \n", __func__, number, data, id);
	return SUCCESS;
}

void print_help(char *argv)
{
	printf(	"%s: ./%s [[option] [arguments] ...]		\n"
		"-a or --area			area		\n"
		"-p or --perimeter		perimenter	\n"
		"-l <arg> or --length <arg>	add length	\n"
		"-b <arg> or --breadth <arg>	add breadth	\n",
		argv, argv);
	return;
}

/************************************************
 * Function with Variable Parameters		*
 ************************************************/
int function_with_variable(int argc, char** argv)
{
	static struct option long_options[] = {
		{"area",	no_argument,		0,	'a'	},
		{"perimeter",	no_argument,		0,	'p'	},
		{"length",	required_argument,	0,	'l'	},
		{"breadth",	required_argument,	0,	'b'	},
		{0,		0,			0,	0	}
	};
	int opt = 0, area = -1, perimeter = -1, breadth = -1, length = -1;
	int long_index = 0;

	while ((opt = getopt_long(argc, argv, "apl:b:", long_options,
		&long_index )) != -1) {
		switch (opt) {
		case 'a':
			area = 0;
			break;
		case 'p':
			perimeter = 0;
			break;
		case 'l':
			length = atoi(optarg);
			break;
		case 'b':
			breadth = atoi(optarg);
			break;
		default	:
			print_help(argv[0]);
			return FAILURE;
			break;
		}
	}

	/* Normal Function Operations */
	printf("%s: area=%d peri=%d len=%d bre=%d \n", __func__, area,
		perimeter, length, breadth);
	return SUCCESS;
}


/************************************************
 * Demo						*
 ************************************************/
int main(int argc, char** argv)
{
	int a = 50;
	long data = 0xABCD;
	char id = 'a';
	int ret = 0;

	/* Demonstrate the use of function with parameters */
	ret = function_with_param(a, data, id);
	if (ret)
		return FAILURE;

	/* Demonstrate the use of function with variable parameters */
	ret = function_with_variable(argc, argv);
	if (ret)
		return FAILURE;

	return SUCCESS;
}
