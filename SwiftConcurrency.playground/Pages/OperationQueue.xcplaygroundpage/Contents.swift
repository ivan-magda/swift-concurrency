/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Operation Queue
 */
import Foundation

final class OperationQueueDemo {

    private final class SomeOperation: Operation {
        override func main() {
            print("SomeOperation")
        }
    }

    private let operationQueue = OperationQueue()

    func run() {
        let someOperation = SomeOperation()
        operationQueue.addOperation(someOperation)

        operationQueue.addOperation {
            print("Block")
        }
    }

}

OperationQueueDemo().run()
