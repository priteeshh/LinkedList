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



//Loop

var node = Node(value: 1)
var node1 = Node(value: 2)
var node2 = Node(value: 3)
var node3 = Node(value: 4)

node.next = node1
node1.next = node2
node2.next = node3
node3.next = node2

//print(node.value)
print(hasLoop(n: node))

//duplicate


var noded = Node(value: 1)
var noded1 = Node(value: 2)
var noded2 = Node(value: 3)
var noded3 = Node(value: 3)
var noded4 = Node(value: 4)

noded.next = noded1
noded1.next = noded2
noded2.next = noded3
noded3.next = noded4
print("sjfs")
print(noded)
removeDuplicat(n: noded)
print(noded)
