/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Concurrent Perform
 */
import Foundation

final class ConcurrentPerform {
    func run() {
        DispatchQueue.concurrentPerform(iterations: 10) { (i) in
            print(i)
        }
    }
}

ConcurrentPerform().run()
