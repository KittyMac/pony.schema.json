use "ponytest"
use "json"

actor Main is TestList
	new create(env: Env) => PonyTest(env, this)
	new make() => None

	fun tag tests(test: PonyTest) =>
		test(_Test1)
		test(_Test2)
		test(_Test3)
		test(_Test4)


class iso _Test1 is UnitTest
	fun name(): String => "test 1 - simple object"

	fun apply(h: TestHelper) =>
		try
			// read it, write it, read it again then test if true
			let person1 = Person.fromString(Test1Json())?
			let person2 = Person.fromString(person1.string())?
			
			h.env.out.print(person2.string())
			
			h.complete(
					(person2.firstName == "John") and 
					(person2.lastName == "Doe") and 
					(person2.age == 21) and
					(person2.height == 5.2) and
					(person2.married == true)
				)
		else
			h.complete(false)
		end

class iso _Test2 is UnitTest
	fun name(): String => "test 2 - root array"

	fun apply(h: TestHelper) =>
		try
			// read it, write it, read it again then test if true
			let words1 = Words.fromString(Test2Json())?
			let words2 = Words.fromString(words1.string())?
			h.env.out.print(words2.string())
			
			h.complete(
					(words2(0)? == "cat") and 
					(words2(1)? == "dog") and 
					(words2(2)? == "bunny")
				)
		else
			h.complete(false)
		end

class iso _Test3 is UnitTest
	fun name(): String => "test 3 - multiple classes example with arrays"

	fun apply(h: TestHelper) =>
		try
			let toys1 = Toys.fromString(Test3Json())?
			let toys2 = Toys.fromString(toys1.string())?
			
			h.env.out.print(toys2.string())
			
			let toy1 = toys2(0)?
			let toy2 = toys2(1)?
						
			h.complete(
					(toy1.name == "Robot") and (toy1.limited == false) and 
					(toy1.materials(0)? == "plastic") and (toy1.materials(1)? == "steel") and
					(toy1.parts(0)? == "arm") and (toy1.parts(1)? == "leg") and (toy1.parts(2)? == "head") and
					
					(toy2.name == "Doll") and (toy2.limited == true) and (toy2.materials(0)? == "cloth") and
					(toy2.materials(0)? == "cloth") and (toy2.materials(1)? == "stuffing") and (toy2.materials(2)? == "button") and
					(toy2.parts(0)? == "hair") and (toy2.parts(1)? == "head") and (toy2.parts(2)? == "body") and
					(toy2.size == 99) and
					
					true
				)
		else
			h.complete(false)
		end


class iso _Test4 is UnitTest
	fun name(): String => "test 4 - default values"

	fun apply(h: TestHelper) =>
		// values are supplied as the default values in the schema
		let person = Person.empty()

		h.complete(
				(person.firstName == "Jane") and 
				(person.lastName == "Doe") and 
				(person.age == 16) and
				(person.height == 5.5) and
				(person.married == false)
			)
