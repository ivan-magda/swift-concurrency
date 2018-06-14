/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Suspend
 */
import Foundation

final class Suspend {

    private let operationQueue = OperationQueue()

    func run() {
        let operation1 = BlockOperation {
            sleep(1)
            print("test1")
        }

        let operation2 = BlockOperation {
            sleep(1)
            print("test2")
        }

        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)

        operationQueue.isSuspended = true
    }
}

Suspend().run()
