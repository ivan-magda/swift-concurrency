/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Concurrent Perform
 */
import Foundation

final class ConcurrentPerform {
    func run() {
        // 1. Allows you to effectively use the free resources of the system.
        // 2. Effective for a large number of iterations.
        DispatchQueue.concurrentPerform(iterations: 10) { (i) in
            print(i)
        }
    }
}

ConcurrentPerform().run()
