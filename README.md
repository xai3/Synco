# Synco
Simple @syncronized for Swift.

## Usage

`Lock` has `sync` method. (both instance method and class method)

##### Instance method

``` swift
let lock = Lock()

lock.sync {
  // some code
}

let result = lock.sync {
  return "result"
}
```

##### Class method

``` swift
Lock.sync(self) {
  // some code
}

let result = Lock.sync(self) {
  return 1
}
```

## License

Synco is released under the MIT license. See LICENSE for details.
