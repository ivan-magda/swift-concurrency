/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Dispatch Barrier
 */
import Foundation

final class DispatchBarrier {

    private let queue = DispatchQueue(
        label: "DispatchBarrier",
        qos: .background,
        attributes: .concurrent,
        autoreleaseFrequency: .inherit,
        target: nil
    )

    private var value = 0

    func setValue(_ value: Int) {
        queue.async(flags: .barrier) {
            self.value = value
        }
    }

    func getValue() -> Int {
        var temp = 0

        queue.sync {
            temp = self.value
        }

        return temp
    }

}
