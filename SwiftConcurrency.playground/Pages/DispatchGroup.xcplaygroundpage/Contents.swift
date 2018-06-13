/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Dispatch Group
 */
import Foundation

final class DispatchGroupDemo1 {

    private let group = DispatchGroup()
    private let queue = DispatchQueue.init(
        label: "DispatchGroupDemo1",
        qos: .background,
        attributes: .concurrent,
        autoreleaseFrequency: .inherit,
        target: nil
    )

    func run() {
        queue.async(group: group) {
            sleep(1)
            print("DispatchGroupDemo1: 1")
        }
        queue.async(group: group) {
            sleep(2)
            print("DispatchGroupDemo1: 2")
        }

        group.notify(queue: DispatchQueue.main) {
            print("DispatchGroupDemo1: finish all")
        }
    }

}

DispatchGroupDemo1().run()


final class DispatchGroupDemo2 {

    private let group = DispatchGroup()
    private let queue = DispatchQueue.init(
        label: "DispatchGroupDemo2",
        qos: .background,
        attributes: .concurrent,
        autoreleaseFrequency: .inherit,
        target: nil
    )

    func run() {
        group.enter()
        queue.async {
            sleep(1)
            print("DispatchGroupDemo2: 1")
            self.group.leave()
        }

        group.enter()
        queue.async {
            sleep(2)
            print("DispatchGroupDemo2: 2")
            self.group.leave()
        }

        group.wait()
        print("DispatchGroupDemo2: finish all")
    }

}

DispatchGroupDemo2().run()
