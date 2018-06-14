/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Max Concurrent Operation Count
 */
import Foundation

final class OperationCount {

    private let operationQueue = OperationQueue()

    func run() {
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.addOperation {
            sleep(1)
            print("1")
        }

        operationQueue.addOperation {
            sleep(1)
            print("2")
        }

        operationQueue.addOperation {
            sleep(1)
            print("3")
        }
    }

}

OperationCount().run()
