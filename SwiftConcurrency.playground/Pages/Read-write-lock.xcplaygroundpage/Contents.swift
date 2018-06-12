/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Read Write Lock
 */
import Foundation

final class ReadWriteLock {

    private var lock = pthread_rwlock_t()
    private var attr = pthread_rwlockattr_t()

    private var value = 0

    init() {
        pthread_rwlock_init(&lock, &attr)
    }

    var readWriteLockProperty: Int {
        get {
            pthread_rwlock_rdlock(&lock)
            let temp = value
            pthread_rwlock_unlock(&lock)
            return temp
        }
        set {
            pthread_rwlock_wrlock(&lock)
            value = newValue
            pthread_rwlock_unlock(&lock)
        }
    }
    
}
