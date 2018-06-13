/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Queues
 */
import Foundation

final class Queue {

    // All queues is serial by default.
    // Do their job sequentially.
    private let serialQueue = DispatchQueue(label: "serialQueue")

    private let concurrentQueue = DispatchQueue.init(
        label: "concurrentQueue",
        qos: .background,
        attributes: .concurrent,
        autoreleaseFrequency: .inherit,
        target: nil
    )

}

final class QueuePool {

    // All global queues is concurrent by default.
    private let globalQueue = DispatchQueue.global()

    private let mainQueue = DispatchQueue.main

}
