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
