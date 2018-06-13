/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Queues
 */
import Foundation

final class AsyncVsSyncSerial {

    private let serialQueue = DispatchQueue(label: "serialQueue")

    func run() {
        serialQueue.async {
            print("a")
        }

        serialQueue.async {
            sleep(1)
            print("b")
        }

        serialQueue.sync {
            print("c")
        }

        serialQueue.sync {
            print("d")
        }
    }

}

AsyncVsSyncSerial().run()
print("******************")

final class AsyncVsSyncConcurrent {

    private let concurrentQueue = DispatchQueue.init(
        label: "concurrentQueue",
        qos: .background,
        attributes: .concurrent,
        autoreleaseFrequency: .inherit,
        target: nil
    )

    func run() {
        concurrentQueue.async {
            print("a")
        }

        concurrentQueue.async {
            print("b")
        }

        concurrentQueue.sync {
            print("c")
        }

        concurrentQueue.sync {
            print("d")
        }
    }

}

AsyncVsSyncConcurrent().run()

final class AsyncAfter {

    private let concurrentQueue = DispatchQueue.init(
        label: "AsyncAfter",
        qos: .background,
        attributes: .concurrent,
        autoreleaseFrequency: .inherit,
        target: nil
    )

    func run() {
        concurrentQueue.asyncAfter(deadline: .now() + 3) {
            print("AsyncAfter")
        }
    }

}

AsyncAfter().run()
