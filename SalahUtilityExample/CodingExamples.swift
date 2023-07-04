//
//  CodingExamples.swift
//  SalahUtilityExample
//
//  Created by SalahMohamed on 11/04/2023.
//  Copyright © 2023 Salah. All rights reserved.
//
import Foundation

// MARK: - Nested Function

 class Foo {
   func someSharedFunction() { }

   func outer1() {
     func innerFunc() {
       someSharedFunction()
     }
     // some work that calls `innerFunc()`
   }

   func outer2() {
     let innerClosure = {
       self.someSharedFunction()
     }
     // some work that calls `innerClosure()`
   }
 }

// MARK: - Generic Struct Example 1
//protocol Processor<T> {
//    associatedtype T
//    func process(data: Data) throws -> T
//}
//
//struct ProcessorEntry<T> {
//    let type: T.Type
//    let processor: any Processor<T>
//}
//ProcessorEntry<String>.init(type:"", processor:nil)

// MARK: - Generic Struct Example 2
//protocol Processor {
//    associatedtype T
//    func process(data: Data) throws -> T
//}
//
//struct ProcessorEntry<P: Processor> {
//    let type: P.T.Type
//    let processor: P
//}
///----


//
//struct Saveable {
//    let save: () -> Void
//}
//
//protocol Processor {
//    func process(data: Data) throws -> Saveable?
//}
//
//func run(processors: [Processor], data: Data) throws {
//    let results = try processors.map {
//        try $0.process(data: data)
//    }
//    for result in results {
//        result?.save()
//    }
//}
//
//class FooProcessor: Processor {
//    func process(data: Data) throws -> Saveable? {
////        let foo = try Foo(data.what.ever)
//        return nil
//    }
//}
///----

//let entries: [ProcessorEntry] = [
//    ProcessorEntry.foo(type: FooPushMessage.self, processor: FooProcak()),
//    ProcessorEntry.bar(type: BarPushMessage.self, processor: BarProcak()),
//]
//
//enum ProcessorEntry {
//    case foo(type: FooPushMessage.Type, processor: FooProcak)
//    case bar(type: BarPushMessage.Type, processor: BarProcak)
//}
//
//func processMessage<T: PushMessage>(processors: [ObjectIdentifier: Any], message: T) {
//    let dictionary = entries
//        .map {
//            switch $0 {
//            case .foo(let type, let processor):
//                return (ObjectIdentifier(type), processor)
//            case .bar(let type, let processor):
//                return (ObjectIdentifier(type), processor)
//            }
//        }
//        .associate()

///----

//protocol PushMessage {
//}
//
//class Procak<T: PushMessage> {
//    open func canProcess(_ type: Any.Type) -> Bool {
//        false
//    }
//    open func process(message: T) {
//    }
//}
//
//class BaseProcak<T : PushMessage>: Procak<T> {
//    override func canProcess(_ type: Any.Type) -> Bool {
//        type == T.self
//    }
//}

///----


//protocol Processor2 {
//    associatedtype T: PushMessage
//    func process(message: T)
//}
//
//struct ProcessorEntry {
//    let key: ObjectIdentifier
//    let processor: any Processor2
//
//    private init(key: ObjectIdentifier, processor: any Processor2) {
//        self.key = key
//        self.processor = processor
//    }
//}

///----


//protocol Processor<T> {
//    associatedtype T
//
//    func process(message: T)
//}
//
//struct StringProcessor: Processor {
//    func process(message: String) {
//        print(message)
//    }
//}
//struct IntProcessor: Processor {
//    func process(message: Int) {
//        print(message)
//    }
//}
//
//let p: any Processor = StringProcessor()
//
//let p1 = p as? any Processor<String>
//p1?.process(message: "hello")
//
//let p2 = p as? any Processor<Int>
//p2?.process(message: 42)
