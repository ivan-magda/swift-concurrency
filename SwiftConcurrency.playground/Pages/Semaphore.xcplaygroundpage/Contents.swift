/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Semaphore
 */
import Foundation

final class Semaphore {

    private let semaphore = DispatchSemaphore(value: 0)

    func run() {
        DispatchQueue.global().async {
            sleep(3)
            print("Do some job 1 {Semaphore}")
            self.semaphore.signal()
        }

        semaphore.wait()
        print("Do some job 2 {Semaphore}")
    }

}

Semaphore().run()

final class SemaphoreMultiple {

    private let semaphore = DispatchSemaphore(value: 2)

    func run() {
        DispatchQueue.global().async {
            self.do()
        }
        DispatchQueue.global().async {
            self.do()
        }
        DispatchQueue.global().async {
            self.do()
        }
    }

    private func `do`() {
        semaphore.wait()
        print("Do something... {SemaphoreMultiple}")
        sleep(3)
        semaphore.signal()
    }

}

SemaphoreMultiple().run()
