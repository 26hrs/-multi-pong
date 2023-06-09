
// Note.swift
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

public func == (lhs: Note, rhs: Note) -> Bool {
  return lhs.circleAngle == rhs.circleAngle
}

public enum Note : CustomStringConvertible, CustomDebugStringConvertible, Hashable {

  case a(Accidental)
  case b(Accidental)
  case c(Accidental)
  case d(Accidental)
  case e(Accidental)
  case f(Accidental)
  case g(Accidental)

  public init(key: Note, degree: Degree) {

    let notes = Notes(initialNote: key, sortsharp: degree.accidental == .sharp)

    var noteMap: [Int : Note] = [:]
    noteMap[-30] = notes[-1]
    noteMap[0] = notes[0]
    noteMap[30] = notes[1]
    noteMap[60] = notes[2]
    noteMap[90] = notes[3]
    noteMap[120] = notes[4]
    noteMap[150] = notes[5]
    noteMap[180] = notes[6]
    noteMap[210] = notes[7]
    noteMap[240] = notes[8]
    noteMap[270] = notes[9]
    noteMap[300] = notes[10]
    noteMap[330] = notes[11]
    noteMap[360] = notes[12]
    noteMap[390] = notes[13]

    guard let note = noteMap[degree.circleAngle] else {
      fatalError("OMG")
    }

    self = note
  }

  var circleAngle: Int {

    let rawAngle: Int
    switch self {
    case .a(let a):
      rawAngle = 0 + a.circleAngle
    case .b(let a):
      rawAngle = 60 + a.circleAngle
    case .c(let a):
      rawAngle = 90 + a.circleAngle
    case .d(let a):
      rawAngle = 150 + a.circleAngle
    case .e(let a):
      rawAngle = 210 + a.circleAngle
    case .f(let a):
      rawAngle = 240 + a.circleAngle
    case .g(let a):
      rawAngle = 300 + a.circleAngle
    }

    if rawAngle < 0 {
      assert(rawAngle >= -360, "Can't handle")
      return (360 + rawAngle) % 360
    } else {
      return rawAngle % 360
    }
  }

  public func natural() -> Note {
    return applyAccidental(accidental: .natural)
  }

  public func flat() -> Note {
    return applyAccidental(accidental: .flat)
  }

  public func sharp() -> Note {
    return applyAccidental(accidental: .sharp)
  }

  public func applyAccidental(accidental: Accidental) -> Note {

    let notes = Notes(initialNote: self, sortsharp: accidental == .sharp)
    switch accidental {
    case .natural:
      switch self {
      case .a:
        return .a(.natural)
      case .b:
        return .b(.natural)
      case .c:
        return .c(.natural)
      case .d:
        return .d(.natural)
      case .e:
        return .e(.natural)
      case .f:
        return .f(.natural)
      case .g:
        return .g(.natural)
      }
    case .flat:
      return notes[-1]
    case .sharp:
      return notes[1]
    }
  }

  public var debugDescription: String {
    return description
  }

  public var description: String {
    return baseNoteString + accidental.description
  }

  public var hashValue: Int {
    return circleAngle
  }

  private var baseNoteString: String {

    switch self {
    case .a:
      return "A"
    case .b:
      return "B"
    case .c:
      return "C"
    case .d:
      return "D"
    case .e:
      return "E"
    case .f:
      return "F"
    case .g:
      return "G"
    }
  }

  private var accidental: Accidental {

    switch self {
    case .a(let accidental):
      return accidental
    case .b(let accidental):
      return accidental
    case .c(let accidental):
      return accidental
    case .d(let accidental):
      return accidental
    case .e(let accidental):
      return accidental
    case .f(let accidental):
      return accidental
    case .g(let accidental):
      return accidental
    }
  }
}