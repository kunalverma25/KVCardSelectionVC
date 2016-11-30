# Try

Try allows you to handle Objective-C exceptions using Swift error handling. There are a lot of APIs in Objective-C that can throw exceptions that are simply unhandable in Swift. For example, NSKeyedUnarchiver can throw an exception if you attempt to coerce a value to an incompatible type. 

In the below example, we'll decode an `int` that was written by an `NSKeyedArchiver`. If this data actually encoded a `float` the `decodeIntForKey(_:)` method would normally throw an exception, but with Try it throws a Swift error, and we can handle it gracefully. The method will handle the error in a more Swift-friendly way by returning `nil`.

```swift
func decodeCountFromData(data: Data) -> Int? {
	let archiver = NSKeyedUnarchiver(forReadingWith: data)
	defer { archiver.finishDecoding() }
	
	do {
	    try trap {
	    	return archiver.decodeInteger(forKey: "count")
	    }
	} catch let error as NSError {
	    if let exception = error.userInfo[tryExceptionErrorKey] as? NSException {
	        dlog("ERROR: Exception decoding count: \(exception)")
	    } else {
	        dlog("ERROR: Unknown decoding error: \(error)")
	    }
	
	    return nil
	}
}
```

## Contributors

The concept & original implementation was done by [Jacob Berkman](https://github.com/jberkman).
