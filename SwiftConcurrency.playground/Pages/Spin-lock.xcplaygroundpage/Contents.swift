/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Spin Lock
 */
import Foundation

/**
 * Spin lock represents while loop.
 * Spin on contention.
 *
 * Best for usage when:
 * - short time period
 * - there is not too much threads
 */
final class SpinLock {

    private var lock = OS_SPINLOCK_INIT

    func run() {
        OSSpinLockLock(&lock)
        print(#function)
        OSSpinLockUnlock(&lock)
    }

}

SpinLock().run()

/**
 * Reduces contex-switch operation.
 *
 * Best for usage when:
 * - thread asks for resource for multiple times
 */
final class UnfairLock {

    private var lock = os_unfair_lock_s()

    func run() {
        os_unfair_lock_lock(&lock)
        print(#function)
        os_unfair_lock_unlock(&lock)
    }

}

UnfairLock().run()
