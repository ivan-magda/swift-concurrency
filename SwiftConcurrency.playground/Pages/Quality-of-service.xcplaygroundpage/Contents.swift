/*:
 [Table of contents](Table-of-contents) • [Previous page](@previous) • [Next page](@next)

 # Quality of Service

 The quality of service API, or QoS was actually introduced in iOS 8.

 QoS can be applied all over iOS as well.
 One can prioritize queues, thread objects, dispatches queues, and POSIX threads.
 This is important, since asynchronous work is typically spread out across all of these techniques.
 By assigning the correct priority for the work these methods perform, iOS apps remain quick, snappy, and responsive.

 ### Levels of Priority

 QoS breaks out priorities into four different groups, each one corresponds to common tasks:

 - ***User Interactive***: Work that happens on the main thread, such as animations or drawing operations.
 - ***User Initiated***: Work that the user kicks off and should yield immediate results. This work must be completed for the user to continue.
 - ***Utility***: Work that may take a bit and doesn’t need to finish right away. Analogous to progress bars and importing data.
 - ***Background***: This work isn’t visible to the user. Backups, syncs, indexing, etc.

 ```
@available(iOS 8.0, *)
public enum QualityOfService : Int {

 case userInteractive
 case userInitiated
 case utility
 case background
 case `default`

}
 ```
*/
import Foundation

final class PthreadQOS {
    func run() {
        var thread = pthread_t(bitPattern: 0)
        var attr = pthread_attr_t()

        pthread_attr_init(&attr)
        pthread_attr_set_qos_class_np(&attr, QOS_CLASS_USER_INITIATED, 0)
        pthread_create(&thread, &attr, { (pointer) in
            print("pthread QOS: \(qos_class_self())")

            // Update QOS class and relative priority of the current thread.
            pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
            print("pthread QOS: \(qos_class_self())")

            return nil
        }, nil)
    }
}

let pthreadQOS = PthreadQOS()
pthreadQOS.run()

final class ThreadQOS {
    func run() {
        let thread = Thread {
            print("NSThread QOS: \(qos_class_self())")
        }
        thread.qualityOfService = .userInteractive
        thread.start()

        print("Main thread QOS: \(qos_class_main())")
    }
}

let threadQOS = ThreadQOS()
threadQOS.run()
