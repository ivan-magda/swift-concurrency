/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Creating and Starting Threads

 */

//: ## Unix Thread

import Foundation

var thread = pthread_t(bitPattern: 0)
var attr = pthread_attr_t()

pthread_attr_init(&attr)
pthread_create(&thread, &attr, { (pointer) in
    print("Hello from Unix thread!")

    return nil
}, nil)

//: ## NSThread - Objective-C Wrapper on Unix thread

var nsThread = Thread {
    print("Hellow from NSThread!")
}
nsThread.start()
