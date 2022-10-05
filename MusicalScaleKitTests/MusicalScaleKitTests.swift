
import XCTest

@testable import MusicalScaleKit

class MusicalScaleTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testNoteAngle() {
    XCTAssertEqual(Note.a(.natural).sharp().circleAngle, Note.b(.flat).circleAngle)
    XCTAssertEqual(Note.b(.natural).sharp().circleAngle, Note.c(.natural).circleAngle)
    XCTAssertEqual(Note.a(.natural).flat().circleAngle, Note.g(.sharp).circleAngle)
  }

  func testsharp() {

    do { // A
      let note = Note.a(.natural)
      XCTAssertEqual(note.sharp(), Note.a(.sharp))
    }

    do { // B
      let note = Note.b(.natural)
      XCTAssertEqual(note.sharp(), Note.b(.sharp))
    }

    do { // C
      let note = Note.c(.natural)
      XCTAssertEqual(note.sharp(), Note.c(.sharp))
    }

    do { // D
      let note = Note.d(.natural)
      XCTAssertEqual(note.sharp(), Note.d(.sharp))
    }

    do { // E
      let note = Note.e(.natural)
      XCTAssertEqual(note.sharp(), Note.e(.sharp))
    }

    do { // F
      let note = Note.f(.natural)
      XCTAssertEqual(note.sharp(), Note.f(.sharp))
    }

    do { // G