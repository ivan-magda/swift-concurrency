/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Work Item
 */
import Foundation

final class DispatchWorkItemDemo {

    private let concurrentQueue = DispatchQueue.init(
        label: "concurrentQueue",
        qos: .background,
        attributes: .concurrent,
        autoreleaseFrequency: .inherit,
        target: nil
    )

    func run() {
        let workItem = DispatchWorkItem {
            print("Do some job...")
            sleep(1)
        }

        workItem.notify(queue: DispatchQueue.main) {
            print("Finish execution")
            if let currentQueueName = OperationQueue.current?.underlyingQueue?.label {
                print(currentQueueName)
            }
        }

        concurrentQueue.async(execute: workItem)
    }

}

DispatchWorkItemDemo().run()


final class DispatchWorkItemCancelDemo {

    private let queue = DispatchQueue(label: "DispatchWorkItemCancelDemo")

    func run() {
        queue.async {
            sleep(1)
            print("DispatchWorkItemCancelDemo Job 1")
        }

        queue.async {
            sleep(1)
            print("DispatchWorkItemCancelDemo Job 2")
        }

        let item = DispatchWorkItem {
            print("DispatchWorkItem Job")
        }

        queue.async(execute: item)

        // We can only cancel the work item, while it's not started.
        item.cancel()
    }

}

DispatchWorkItemCancelDemo().run()
