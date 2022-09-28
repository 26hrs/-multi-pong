
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