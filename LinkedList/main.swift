//
//  main.swift
//  LinkedList
//
//  Created by Preeteesh Remalli on 30/11/21.
//

import Foundation

class Node<Value>{
    var value: Value
    var next : Node?
    
    init(value: Value, next: Node? = nil){
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible{
    var description: String {
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}



var linkedList = LinkedList<Int>()
linkedList.push(1)
linkedList.push(22)
linkedList.push(33)
linkedList.append(99)
let middleNode = linkedList.node(at: 1)!

print(linkedList)
print(linkedList.remove(after: middleNode))


print(linkedList)
print(linkedList.head?.value)
print(linkedList.tail?.value)
linkedList.reverse()
print(linkedList)
//var stack = Queue<Int>()
//stack.enqueue(10)
//stack.enqueue(20)
//stack.enqueue(50)
//print(stack.head)
//print(stack.dequeue())


var linkedList1 = LinkedList<Int>()
linkedList1.push(1)
linkedList1.push(2)
linkedList1.push(3)
print(linkedList1)
var linkedList2 = LinkedList<Int>()
linkedList2.push(4)
linkedList2.push(5)
linkedList2.push(6)
print(linkedList2)

addTwoNodes(n1: linkedList1.head!, n2: linkedList2.head!)
