use "ponytest"
use "fileExt"
use "stringExt"
use "json"

actor Main is TestList
	new create(env: Env) => PonyTest(env, this)
	new make() => None

	fun tag tests(test: PonyTest) =>
		test(_Test1)
		test(_Test2)
		test(_Test3)


class iso _Test1 is UnitTest
	fun name(): String => "test 1 - simple object"

	fun apply(h: TestHelper) =>
		try
			let jsonString = recover val FileExt.fileToString("test1.json")? end
		
		    let doc: JsonDoc = JsonDoc
		    doc.parse(jsonString)?
			
			let person = Person(doc.data as JsonObject)			
			h.complete(
					(person.firstName == "John") and 
					(person.lastName == "Doe") and 
					(person.age == 21) and
					(person.height == 5.2) and
					(person.married == true)
				)
		else
			h.complete(false)
		end

class iso _Test2 is UnitTest
	fun name(): String => "test 2 - root array"

	fun apply(h: TestHelper) =>
		try
			let jsonString = recover val FileExt.fileToString("test2.json")? end

		    let doc: JsonDoc = JsonDoc
		    doc.parse(jsonString)?
	
			let words = Words(doc.data as JsonArray)			
			h.complete(
					(words(0)? == "cat") and 
					(words(1)? == "dog") and 
					(words(2)? == "bunny")
				)
		else
			h.complete(false)
		end

class iso _Test3 is UnitTest
	fun name(): String => "test 3 - multiple classes example with arrays"

	fun apply(h: TestHelper) =>
		try
			let jsonString = recover val FileExt.fileToString("test3.json")? end

		    let doc: JsonDoc = JsonDoc
		    doc.parse(jsonString)?

			let toys = Toys(doc.data as JsonArray)
			let toy1 = toys(0)?
			let toy2 = toys(1)?
			
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
