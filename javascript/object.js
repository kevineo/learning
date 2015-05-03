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
    Creating Object
******************************************************************/
var object1 = {
    name: "Testafile",
    age: 12
}

var object2 = {};
object2.name = "Testafile";
object2['age'] = 12;

var object3 = new Object();
object3.name = "Testafile";
object3['age'] = 12;



/******************************************************************
    Object Within Object
******************************************************************/
var friends = {
    bill: {
        firstName: "Bill",
        lastName: "Hons",
        number: "555-555-555",
        address: ["2", "Clover Street", "SF", "98052"]
    },
    steve: {
        firstName: "Steve",
        lastName: "Bell",
        number: "666-6666-6666",
        address: ["10", "Dragon Street", "WD", "23300"]
    }
};

var list = function(param) {
    for (var key in param) {
        console.log(key);
    }
}

var search = function(name) {
    for (var key in friends) {
        if (friends[key].firstName === name) {
            console.log(friends[key]);
            return friends[key];
        }
    }
}

list(friends);
search("Steve");


/******************************************************************
    Constructor Object
******************************************************************/
function Person(name, age) {
    this.name = name;
    this.age = age;
}
var susan = new Person("susan", 5);
var dexter = new Person("dexter", 5);


/******************************************************************
    Private Variables
******************************************************************/
function Person(first,last,age) {
   this.firstname = first;
   this.lastname = last;
   this.age = age;
   var bankBalance = 7500;
  
   this.getBalance = function() {
      // Your code should return the bankBalance.
      // You can't access bankBalance outside this function
      return bankBalance;
   };
}

var john = new Person('John','Smith',30);
console.log(john.bankBalance);
myBalance = john.getBalance();
console.log(myBalance);


/******************************************************************
    Adding Method into Class
******************************************************************/
function Dog (breed) {
  this.breed = breed;
};

var buddy = new Dog("golden Retriever");
// Adding bark method to the dog function
Dog.prototype.bark = function() {
  console.log("Woof");
};
buddy.bark();

var snoopy = new Dog("Beagle");
snoopy.bark();



/******************************************************************
    Inheritance
******************************************************************/
function Animal(name, numLegs) {
    this.name = name;
    this.numLegs = numLegs;
    this.isAlive = true;
}
function Penguin(name) {
    this.name = name;
    this.numLegs = 2;
}
function Emperor(name) {
    this.name = name;
    this.saying = "Waddle waddle";
}

// set up the prototype chain
Penguin.prototype = new Animal();
Emperor.prototype = new Penguin();

var myEmperor = new Emperor("Jules");

console.log( myEmperor.saying ); // should print "Waddle waddle"
console.log( myEmperor.numLegs ); // should print 2
console.log( myEmperor.isAlive ); // should print true