
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
    
    func testAsync()
    {
        let expectation = self.expectation(description: "Async")
        
        DispatchQueue.global(qos: .default).async {
            
            #Async(queue: .main) {
                
                XCTAssertTrue(Thread.isMainThread)
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 1)
    }
    
    func testA()
    {
        #Async(queue: .main) {
            
            XCTAssertTrue(Thread.isMainThread)
        }
    }
}
