# pony.schema.json

**WARNING** This code relies on custom changes I have in [my fork of Pony](https://github.com/KittyMac/ponyc/tree/roc_master). This version of pony can compile .schema.json files into pony classes automagically.

### Purpose

At the time of this writing, Pony includes a basic JSON parsing library but does not include any support for annotating classes or other fancy serialization support for JSON.

My fork of Pony includes the concept of source file translation, meaning you can drop the source of a support language into your Pony project and it will automatically be transpiled into Pony. For JSON, this means you can add a JSON Schema file and it will compile into equivalent Pony classes capabile of serializing and deserializing themselves.

Note: This repository is here for providing examples and testing the JSON transpiling feature in [my fork of Pony](https://github.com/KittyMac/ponyc/tree/roc_master).  Nothing in this repo is required to use the JSON transpiling feature itself, that's compiled into ponyc.

Note: In the same concept, I have now added transpiling of simple text-based resources to [my fork of Pony](https://github.com/KittyMac/ponyc/tree/roc_master). This example has been updated such that the test .json files make use of this new feature (note that we don't need to load any of these strings in from file, they are automatically compiled as primitives)

## License

pony.flow is free software distributed under the terms of the MIT license, reproduced below. pony.flow may be used for any purpose, including commercial purposes, at absolutely no cost. No paperwork, no royalties, no GNU-like "copyleft" restrictions. Just download and enjoy.

Copyright (c) 2019 Rocco Bowling

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.