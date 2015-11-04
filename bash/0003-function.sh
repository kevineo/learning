# Basic function
function quit {
	exit
}

# Function with parameters
function this_is_function_name {
	echo $1 $2 # $1 and $2 are arguments
}
this_is_function_name param1 param2 param3
