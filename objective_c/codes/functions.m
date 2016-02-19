/* Functions/Methods for Objectives-C
 * ==================================
 * basic functions and blocks
 */




/*
 * Basic function / method coding
 * ==============================
 */

	/* Objective-C Method */
- (void) method_name: (int) argument_1 andSecondArgumentName: (int) argument_2
{
	return 0;
}

	/* Example */
@implementation MathClass

- (void) max:(int) first_number andSecondNumber:(int) second_number
{
	if (num1 > num2)
		return num1;
	else
		return num2;
}

@end

int main()
{
	int a = 100;
	int b = 200;
	int ret;

	ret = [MathClass max:a andSecondNumber:b];
	NSLog(@"The value is: %d", ret);
	return 0;
}




/*
 * Class
 * ==============================
 */

	/* For early delcaration purposes. Ususally seen in header file like .h file.
	 */
@interface AClassName:NSObject

	/*
	 * @property is like class attributes that holds values for the class.
	 * It's similar to class attributes in Ruby / Python.
	 */

		/* Atomic - values can be accessed by one class at a time. Thread-safe. */
	@property (atomic)NSString *last_name;

		/* non-Atomic - value can be accessed by many classes at a time.
		 * Not Thread-safe
		 */
	@property (nonatomic)NSString *first_name;

		/*
		 * retain - pointer that keeps the value in the memory. Replaced by strong.
		 */
	@property (retain)NSString *address;

		/*
		 * readonly - unchangable values by setter. Only read.
		 */
	@property (readonly)NSString *social_security_number;

		/*
		 * readwrite - changable values by setter. Can read and write.
		 */
	@property (readwrite)NSString *remarks;

		/*
		 * strong - replacement for retain
		 */
	@property (strong)NSString *phone_number;

		/*
		 * copy - retain old values should a new value assigned to this property.
		 */
	@property (copy)NSString *bank_transaction;

		/*
		 * assign - allows change of value
		 */
	@property (assign)NSString *latest_tweet;

		/*
		 * weak - pointer that doesn't keep the value in memory.
		 */
	@property (weak)NSString *recent_sentences;


	/*
	 * Declare your methods here, after delcaring the @property
	 */
- (void) AMethod;

@end

	/* The actual implementation. Usually seen in execution file like .m file.
	 */
@implementation AClassName
	/* Define your function here */
- (void) AMethod
{
	return;
}

@end




/*
 * Class Inheritance using : on @interface
 */
@interface Person : NSObject
	/* Person class inherits NSObject */
@end

@interface Employee : Person
	/* Employee Class inherits Person Class */
@end

@implementation Person
@end
@implementation Employee
@end




/*
 * Class Polymorphism through inheritance
 */
@interface LivingThing : NSObject
@property (atomic, strong)NSString *sound;

- (void) cry;
@end

@implementation LivingThing

- (void) cry
{
	if (*sound != NULL)
		NSLog(@"%@", sound);
	return;
}

@end

@interface Human : LivingThing
	/* Modified from parent */
@property (atomic, strong)NSString *sound = @"Hello World";
@end

@implementation Human
	/* Do nothing to the parent implementation */
@end

@interface Duck : LivingThing
	/* Modified from parent */
@property (atomic, strong)NSString *sound = @"Quack";
@end

@implementation Duck
	/* Modified cry from parent */
- (void) cry
{
	[super cry];
	if (*sound != NULL)
		NSLog(@"Quack Quack: %@", sound);
	return;
}

@end




/* Class Data Encapsulation.
 * social_securit_number and total are not accessible outside class Bank.
 */
@interface Bank : NSObject
	{
		NSString *social_security_number; // 123-456-789
		NSString *total;
	}

	- (NSString)getTotal;
	- (NSString)displayPrivateDataOnScreen;
@end

@implementation Bank
- (NSString)getTotal
{
	return total;
}

- (NSString)displayPrivateDataOnScreen
{
	return (@"%XXX-XXX-@%@%@", social_security_number[8],
														 social_security_number[9],
														 social_security_number[10])
}
@end