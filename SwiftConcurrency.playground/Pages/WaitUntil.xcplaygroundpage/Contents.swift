/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Waint Until
 */
import Foundation

final class WaintUntil1 {

    private let operationQueue = OperationQueue()

    func run() {
        operationQueue.addOperation {
            sleep(1)
            print("WaintUntil1: 1")
        }
        operationQueue.addOperation {
            sleep(1)
            print("WaintUntil1: 2")
        }

        operationQueue.waitUntilAllOperationsAreFinished()
    }

}

WaintUntil1().run()

final class WaintUntil2 {

    private let operationQueue = OperationQueue()

    func run() {
        let operation1 = BlockOperation {
            sleep(1)
            print("WaintUntil2: 1")
        }
        let operation2 = BlockOperation {
            sleep(1)
            print("WaintUntil2: 2")
        }

        operationQueue.addOperations(
            [operation1, operation2],
            waitUntilFinished: true
        )
    }

}

WaintUntil2().run()
