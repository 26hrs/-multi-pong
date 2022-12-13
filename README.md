# MusicalScaleKit

[![CI Status](http://img.shields.io/travis/muukii/MusicalScaleKit.svg?style=flat)](https://travis-ci.org/muukii/MusicalScaleKit)
[![Version](https://img.shields.io/cocoapods/v/MusicalScaleKit.svg?style=flat)](http://cocoapods.org/pods/MusicalScaleKit)
[![License](https://img.shields.io/cocoapods/l/MusicalScaleKit.svg?style=flat)](http://cocoapods.org/pods/MusicalScaleKit)
[![Platform](https://img.shields.io/cocoapods/p/MusicalScaleKit.svg?style=flat)](http://cocoapods.org/pods/MusicalScaleKit)

## Example

### Create from ScaleDegree

```swift
public struct Scale {

    public let degrees: [Degree]

    public let key: Note

    public init(key: Note, degrees: [Degree])    

    public var notes: [Note] { get }
}
```

#### Get IonianScale(MajorScale)

```swift
let ionianScale = Scale(
    key: .C(.natural),
    degrees: [
        .one(.natural),
        .two(.natural),
        .three(.natural),
        .four(.natural),
        .