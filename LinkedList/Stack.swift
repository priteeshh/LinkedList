//
//  Stack.swift
//  LinkedList
//
//  Created by Preeteesh Remalli on 01/12/21.
//

import Foundation

struct Stack<T>{
    var head : Node<T>?
    
   mutating func push(_ value: T){
        
        let node = Node(value: value)
        
        if let headNode = head{
            node.next = headNode
            head = node
        }else{
            head = node
        }
    }
    
    mutating func pop() -> Node<T>?{
        if let headNode = head{
           let node = headNode
            
            head = headNode.next
            node.next = nil
            return node
        }
        return nil
        
    }
    
    func peek() -> Node<T>?{
        return head
    }
}

