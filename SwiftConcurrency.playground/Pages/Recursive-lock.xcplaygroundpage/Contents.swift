/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Recursive Lock
 */
import Foundation

final class RecursiveMutex {

    private var mutex = pthread_mutex_t()
    private var attr = pthread_mutexattr_t()

    init() {
        pthread_mutexattr_init(&attr)
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &attr)
    }

    func test1() {
        pthread_mutex_lock(&mutex)
        print(#function)
        test2()
        pthread_mutex_unlock(&mutex)
    }

    func test2() {
        pthread_mutex_lock(&mutex)
        print(#function)
        pthread_mutex_unlock(&mutex)
    }

}

print("PTHREAD_MUTEX_RECURSIVE:")
RecursiveMutex().test1()
print()

final class RecursiveLock {

    private let lock = NSRecursiveLock()

    func test1() {
        lock.lock()
        print(#function)
        test2()
        lock.unlock()
    }

    func test2() {
        lock.lock()
        print(#function)
        lock.unlock()
    }

}

print("NSRecursiveLock:")
RecursiveLock().test1()
