/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Condition
 */
import Foundation

final class MutexCondition {

    private var condition = pthread_cond_t()
    private var mutex = pthread_mutex_t()
    private var check = false

    init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }

    func test1() {
        pthread_mutex_lock(&mutex)
        print(#function)
        while !check {
            print("wait")
            pthread_cond_wait(&condition, &mutex)
        }
        print("Received signal")
        pthread_mutex_unlock(&mutex)
    }

    func test2() {
        pthread_mutex_lock(&mutex)
        print(#function)
        check = true
        pthread_cond_signal(&condition)
        pthread_mutex_unlock(&mutex)
    }

}

final class Condition {

    private let condition = NSCondition()
    private var check = false

    func test1() {
        condition.lock()
        while !check {
            condition.wait()
        }
        condition.unlock()
    }

    func test2() {
        condition.lock()
        check = true
        condition.signal()
        condition.unlock()
    }

}
