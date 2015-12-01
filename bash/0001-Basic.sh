#!/bin/bash

# To print out something
echo "Hello World"
echo -n "echo without enter"
echo "."



echo ""
# Variables
	# Declare Variables
STR="Variable: Hello World"
	# print the variables
echo $STR
	# Concatenate variables with string
echo "Concatenate: $STR"
echo "Concatenate: "$STR

	# Store output from an execution.
		# ( ) bracquet is for running
OUT=$( ls )
echo "execution output variable:" $OUT

	# Local variable inside function
function hello {
	local HELLO="Local Function Variable: World"
	echo $HELLO
}
hello



echo ""
# Logics
T1="foo"
T2="Bar"
if [ "foo" = "foo" ]; then
	echo "if else if expression: evaluated as true"
elif [ "$T1" = "$T2" ]; then
	echo "if else if expression: expression evaluated as false"
else
	echo "if else if expression: expression has no evaluation"
fi

	# Check for file exist
if [ -a "file.ext" ]; then
	echo "file existance: file exist"
else
	echo "file existance: file does not exist"
fi

	# Check for empty string
if [ -z "" ]; then
	echo "empty string: this is an empty string"
fi

	# Check for null variable
		#  ensure you're using without '()'
if [ -z "$null_variable" ]; then
	echo "null variable: Null Variable does not exist"
fi

T1=""
if [ -z "$T1" ]; then
	echo "empty variable: T1 Variable is empty"
fi

	# String is Equal
if [ "foo" == "foo" ]; then
	echo "equal: string is equal"
fi

	# String is not equal
if [ "foo" != "bar" ]; then
	echo "not equal: string is not equal"
fi



echo ""
# Search for Substring
LIST="some string with a substring you want to match"
SOURCE="substring"
if echo "$LIST" | grep -q "$SOURCE"; then
	echo "find word in string: matched";
else
	echo "find word in string: not matched";
fi



echo""
# Switch cases
options="option1"
case options in
	"option1")
		echo "cases: do option 1"
		;;
	"option2")
		echo "cases: do option 2"
		;;
	"option3")
		echo "cases: do option 3"
		;;
	*)
		echo "cases: invalid option"
		;;
esac



echo ""
# Menu Selection
	# Provide options
OPTIONS="option1 option2 option3 break"
	# Form Selection List
select opt in $OPTIONS; do
	case $opt in
		"option1")
			echo "select option: do option 1"
			;;
		"option2")
			echo "select option: do option 2"
			;;
		"option3")
			echo "select option: do option 3"
			;;
		"break")
			break
			;;
		*)
			echo "select option: invalid option"
			;;
	esac
done



echo ""
# Math
echo "Math:" $[1 + 1]



echo ""
# Alias
alias command="A Binary path for execution"


echo "End of file"
