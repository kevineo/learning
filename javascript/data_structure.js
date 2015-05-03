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
/******************************************************************
	Basic Variables
******************************************************************/
var str = "String";
var integer = 5;
var bool = true;
var object = {a:1};
var symbol = Symbol("foo");

/******************************************************************
	Arrays
******************************************************************/
// Simple Array
var array = ["string", 21, true];

// 2 Dimensional Array
var twoDArray = [[1,2], [1,2]];

// 3 Dimensional Array
var threeDArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];

// Jagged Array
var jaggedArray = [[1, 2, 3], [1], [1, 2]];

/******************************************************************
	Identify type of variables
******************************************************************/
typeof str; // "string"
typeof integer; // "number"
typeof bool; // "boolean"
typeof object; // "object"
typeof Math.sin; // "function"
typeof symbol; // "symbol"