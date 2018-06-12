/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Spin Lock
 */
import Foundation

/**
 * Equivalent to Objc synchronized block.
 *
 * `objc_sync_enter` - uses recursive mutex, better to use recursive mutex directly.
 */
final class Synchronized {

    private let lock = NSObject()

    func run() {
        objc_sync_enter(lock)
        print(#function)
        objc_sync_exit(lock)
    }

}

Synchronized().run()
