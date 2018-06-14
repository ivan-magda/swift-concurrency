/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Completion Block
 */
import Foundation

final class CompletionBlock {

    private let operationQueue = OperationQueue()

    func run() {
        let operation = BlockOperation {
            print("BlockOperation")
        }
        operation.completionBlock = {
            print("Finish")
        }

        operationQueue.addOperation(operation)
    }

}

CompletionBlock().run()
