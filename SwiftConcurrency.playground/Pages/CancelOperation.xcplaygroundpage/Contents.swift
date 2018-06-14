/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Cancel Operation
 */
import Foundation

final class CancelOperationDemo {

    private let operationQueue = OperationQueue()

    private final class CancelOperation: Operation {
        override func main() {
            if isCancelled {
                return
            }
            sleep(1)
            if isCancelled {
                return
            }
            print("test")
        }
    }

    func run() {
        let cancelOperation = CancelOperation()
        operationQueue.addOperation(cancelOperation)
        cancelOperation.cancel()
    }
    
}

CancelOperationDemo().run()
