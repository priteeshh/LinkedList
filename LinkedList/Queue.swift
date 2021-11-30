//
//  Queue.swift
//  LinkedList
//
//  Created by Preeteesh Remalli on 01/12/21.
//

import Foundation

struct Queue<T>{
    var head : Node<T>?
    var tail : Node<T>?
    
    var count = 0
    
   mutating func enqueue(_ value: T){
       
       let newNode = Node(value: value)
        
       if let tailNode = tail{
           tailNode.next = newNode
           tail = newNode
       }else{
           head = newNode
           tail = newNode
       }
       count += 1
    }
    
    mutating func dequeue() -> Node<T>?{
        
        if let headNode = head{
            head = head?.next
            headNode.next = nil
            return headNode
            count -= 1
        }
        
        return nil
    }
    
}
