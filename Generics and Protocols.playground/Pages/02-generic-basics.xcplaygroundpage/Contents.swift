//: [Previous](@previous)

// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

//struct Stack {
//
//  private var storage: [Any] = []
//
//  mutating func push(_ element: Any) {
//    storage.append(element)
//  }
//
//  mutating func pop() -> Any? {
//    return storage.popLast()
//  }
//
//  var top: Any? {
//    return storage.last
//  }
//
//  var isEmpty: Bool {
//    return top == nil
//  }
//
//}
//
//var stack = Stack()
//stack.push(20)
//stack.push(21)
//stack.pop() as! Int

struct Stack<Element> {
  
  private var storage: [Element] = []
  
  mutating func push(_ element: Element) {
    storage.append(element)
  }
  
  mutating func pop() -> Element? {
    return storage.popLast()
  }
  
  var top: Element? {
    return storage.last
  }
  
  var isEmpty: Bool {
    return top == nil
  }
  
}

var stack = Stack<Int>()
stack.push(20)
stack.push(21)
stack.pop()

extension Stack: ExpressibleByArrayLiteral {
  init(arrayLiteral elements: Element...) {
    self.storage = elements
  }
}

var ints: Stack = [1, 2, 3]
ints.pop()
ints.push(4)
ints.top
ints.isEmpty


//: [Next](@next)
