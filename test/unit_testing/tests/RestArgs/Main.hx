package;

import haxe.PosInfos;

class Main {
	static var returnCode = 0;

	static function assert(b: Bool, infos: Null<PosInfos> = null) {
		if(!b) {
			haxe.Log.trace("Assert failed", infos);
			returnCode = 1;
		}
	}

	// test haxe.Rest functions
	static function oneTwoThree(...numbers: Int) {
		// Ensure can be treated like Array<T>
		assert(numbers == [1, 2, 3]);
		assert(numbers.toString() == "[1, 2, 3]");
		
		// toArray
		final arr = numbers.toArray();
		arr.push(123);
		assert(arr.toString() == "[1, 2, 3, 123]");

		// iterator/for-loop
		var i = 1;
		for(a in numbers) {
			assert(a == i);
			i++;
		}

		// append
		assert(numbers.append(4) == [1, 2, 3, 4]);

		// prepend
		assert(numbers.prepend(0) == [0, 1, 2, 3]);
	}

	// test haxe.Rest<String>
	static function testRest(strings: haxe.Rest<String>) {
		assert(strings == ["one", "two", "three"]);
	}

	// TODO
	// test w/ anonymous structures
	// static function testRestAny(anys: haxe.Rest<{ data: Any }>) {
	// 	trace("aaaaaaa");
	// 	try {
	// 		trace(Std.string((anys[1].data : Array<Int>)));
	// 	} catch(e: ucpp.Value<ucpp.std.Exception>) {
	// 		trace("1");
	// 		trace(Std.string(e.what()));
	// 	}

	// 	try {
	// 		assert((anys[1].data : Array<Int>)[1] == 500);
	// 		trace("bbbbbbbbbb");
	// 	} catch(e: ucpp.Value<ucpp.std.Exception>) {
	// 		trace("2");
	// 		trace(Std.string(e.what()));
	// 	}

	// 	try {
	// 		assert((anys[1].data : Array<Int>)[2] == 1000);
	// 	} catch(e: ucpp.Value<ucpp.std.Exception>) {
	// 		trace("3");
	// 		trace(Std.string(e.what()));
	// 	}
	// }

	@:topLevel
	@:dce(Off)
	public static function main(): Int {
		// asserts will only work with 1, 2, 3
		oneTwoThree(1, 2, 3);

		// test with String + haxe.Rest arg
		testRest("one", "two", "three");

		// TODO
		// extreme example using anonymous structures and Array
		// testRestAny({ data: null }, { data: [0, 500, 1000] });

		return returnCode;
	}
}