
// Notes.swift
//
// Copyright (c) 2015 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

public struct Notes: Collection {

  public func index(after i: Int) -> Int {
    return i + 1
  }

  public var startIndex: Int {
    return 0
  }

  public var endIndex: Int {
    return count
  }

  public func index(of element: Note) -> Int? {
    return self.allNotes.index(of: element).flatMap { $0 - initialIndex }
  }

  public subscript(i: Int) -> Note {

    if i < 0 {
      let index = ((abs(i) + (self.allNotes.count - 1 - initialIndex)) % (self.allNotes.count))
      return self.allNotes.reversed()[index]

    } else {
      let index = ((i + initialIndex) % (self.allNotes.count))
      let note = self.allNotes[index]
      return note
    }
  }