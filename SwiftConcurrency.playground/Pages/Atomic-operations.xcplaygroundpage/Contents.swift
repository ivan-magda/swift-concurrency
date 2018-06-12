/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Atomic-operations

 Links:
 - [ThreadSafety](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/ThreadSafety/ThreadSafety.html)
 - [Threading Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/CreatingThreads/CreatingThreads.html#//apple_ref/doc/uid/10000057i-CH15-SW19)
 - [mikeash - Locks Thread Safety and Swift](https://www.mikeash.com/pyblog/friday-qa-2017-10-27-locks-thread-safety-and-swift-2017-edition.html)
 - [mikeash - A Tour of osatomic](https://www.mikeash.com/pyblog/friday-qa-2011-03-04-a-tour-of-osatomic.html)

 */
import Foundation

final class AtomicOperationsPseudoCode {

    func compareAndSwap(old: Int, new: Int, value: UnsafeMutablePointer<Int>) -> Bool {
        if value.pointee == old {
            value.pointee = new

            return true
        }

        return false
    }

    func atomicAdd(amount: Int, value: UnsafeMutablePointer<Int>) -> Int {
        var success = false
        var new = 0

        while !success {
            let original = value.pointee
            new = original + amount
            success = compareAndSwap(old: original, new: new, value: value)
        }

        return new
    }

}

final class AtomicOperationsUsage {

    private var i: Int64 = 0

    func run() {
        OSAtomicCompareAndSwap64Barrier(i, 10, &i)
        OSAtomicAdd64Barrier(20, &i)
        OSAtomicIncrement64Barrier(&i)

        print(i)
    }

}

AtomicOperationsUsage().run()


final class MemoryBarrierPseudoCode {

    private final class Values {
        var first: Int?
        var second: Int?
    }

    private var values: Values?

    func run() {
        let thread1 = Thread {
            let values = Values()
            values.first = 4
            values.second = 16
            OSMemoryBarrier()
            self.values = values
        }
        thread1.start()

        let thread2 = Thread {
            while self.values == nil {}
            OSMemoryBarrier()

            guard let values = self.values,
                let first = values.first,
                let second = values.second else {
                return
            }

            print(first)
            print(second)
        }
        thread2.start()
    }
}

MemoryBarrierPseudoCode().run()
