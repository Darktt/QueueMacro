
import XCTest
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
@testable import QueueMacro

final class QueueMacroTests: XCTestCase 
{
    func testIsMainQueue()
    {
        DispatchQueue.global(qos: .default).async {
            
            #MainQueue {
                
                XCTAssertTrue(Thread.isMainThread)
            }
        }
    }
}
