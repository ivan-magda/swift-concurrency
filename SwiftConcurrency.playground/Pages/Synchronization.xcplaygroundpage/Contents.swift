/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Synchronization
 */
import Foundation

final class PthreadMutex {

    private var mutex = pthread_mutex_t()

    init() {
        pthread_mutex_init(&mutex, nil)
    }

    func run() {
        pthread_mutex_lock(&mutex)
        print("Do synchronized (pthread)")
        pthread_mutex_unlock(&mutex)
    }

}

PthreadMutex().run()

private final class NSLockMutex {

    private let lock = NSLock()

    func run() {
        lock.lock()
        print("Do synchronized (NSLock)")
        lock.unlock()
    }

}

NSLockMutex().run()
