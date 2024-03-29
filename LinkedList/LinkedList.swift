//
//  LinkedList.swift
//  LinkedList
//
//  Created by Preeteesh Remalli on 01/12/21.
//

import Foundation
struct LinkedList<Value>{
    var head : Node<Value>?
    var tail : Node<Value>?
    
    init() {}
    
    mutating func push(_ value: Value){
        self.head = Node(value: value, next: head)
        
        if tail == nil{
            tail = head
        }
    }
    
    mutating func append(_ value: Value){
        if isEmpty{
            push(value)
        }else{
            let node = Node(value: value)
            self.tail?.next = node
            self.tail = node
        }
        
        
    }
    
    func node(at index: Int) -> Node<Value>?{
        
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index){
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value, after node: Node<Value>){
        node.next = Node(value: value, next: node.next)
        
    }
    
    mutating func pop() -> Value?{
        
        defer{
            head = head?.next
            if head == nil{
                tail = nil
            }
        }
        return head?.value
    }
    
   mutating func removeLast() -> Value?{
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else{
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next{
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
        
    }
    
    mutating func remove(after node: Node<Value>) -> Value?{
        
        defer{
            
            if node.next === tail{
                tail = node
            }
            node.next = node.next?.next

        }
        
        return node.next?.value
        
        
    }
    
    mutating func reverse() {
        var currentNode = head
        var newNext : Node<Value>? = nil
        
        while let node = currentNode{
            let next = node.next
            node.next = newNext
            newNext = node
            currentNode = next
        }
        head = newNext
    }
    
    var isEmpty : Bool {
        return head == nil
    }
}

extension LinkedList : CustomStringConvertible{
    
    var description: String{
        guard let head = head else{
            return "Empty List"
        }
        return String(describing: head)
    }
}


func addTwoNodes(n1 : Node<Int>?, n2: Node<Int>?){
    var l1 = n1
    var l2 = n2
    var linkedList = LinkedList<Int>()
    while l1 != nil{
        linkedList.append(l1!.value+l2!.value)
        l1 = l1?.next
        l2 = l2?.next
    }
    print(linkedList)
    
}
func hasLoop<Value>(n : Node<Value>?) -> Bool{
    
    var slow = n
    var fast = n
    
    while (fast != nil && slow != nil){
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast{
            return true
        }
    }
    return false
}

 func removeDuplicat(n : Node<Int>?){
    
    var loop1 = n
    var loop2 : Node<Int>? = nil
    
    while loop1 != nil && loop1?.next != nil{
        loop2 = loop1
        while loop2?.next != nil{
            if loop1?.value == loop2?.next?.value{
                loop2?.next = loop2?.next?.next
            }else{
                loop2 = loop2?.next
            }
        }
        loop1 = loop1?.next
    }
    
    
}
