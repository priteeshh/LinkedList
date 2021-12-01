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
        }
        
        let node = Node(value: value)
        self.tail?.next = node
        self.tail = node
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
