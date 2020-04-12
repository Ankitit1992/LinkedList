import UIKit

var str = "Hello, playground"

class DoublyLinkedList {
    var data:Int
    var prev:DoublyLinkedList?
    var next:DoublyLinkedList?
    
    init(_ data:Int) {
        self.data = data
    }
    
     func insertData(_ data:Int, _ doublyLinkedList:inout DoublyLinkedList?)  {
        var temp = doublyLinkedList
        if temp == nil {
            
            doublyLinkedList = DoublyLinkedList(data)
        }
        else {
            while (temp?.next != nil) {
                
                temp = temp?.next
            }
            let newDoublyLinkedList = DoublyLinkedList(data)
            temp?.next = newDoublyLinkedList
            newDoublyLinkedList.prev = temp
            
            newDoublyLinkedList.next = nil
           
        }
    }
    
    func insertSortedData(_ data:Int, _ doublyLinkedList:inout DoublyLinkedList?) {
        var temp = doublyLinkedList
        if temp == nil {
                   
                   doublyLinkedList = DoublyLinkedList(data)
        }
        
        
        
        while temp != nil {
            if temp?.next == nil {
                 let newNode = DoublyLinkedList(data)
                temp?.next = newNode
                newNode.prev = temp
                newNode.next = nil
                break
            }
            
            if temp?.prev == nil && temp!.data > data {
              let newNode = DoublyLinkedList(data)
                temp?.prev = newNode
                newNode.next = temp
                newNode.prev = nil
                
                temp?.prev = newNode
                doublyLinkedList = newNode
                break
            }
            if temp!.data > data {
                let newNode = DoublyLinkedList(data)
                temp?.prev?.next = newNode
                newNode.prev = temp?.prev
                newNode.next = temp
                temp?.prev = newNode
                break
            } else {
                temp = temp?.next
                
            }
        }
    }
    
    func reverseLinkedList (_ head:inout DoublyLinkedList?) {
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        
        while temp != nil {
            print(temp!.data)
            temp = temp?.prev
        }
    }
    
    func reverseLinkedSecodMethod(_ head:inout DoublyLinkedList?) -> DoublyLinkedList? {
        var temp = head
        var newNode = head
        while temp != nil {
            let pre = temp?.prev
            temp?.next = temp?.prev
            temp?.next = pre
            newNode = temp
            temp = temp?.prev
        }
        return newNode
    }
    
    func reverseLinkedWithRecursion (_ head:inout DoublyLinkedList?) -> DoublyLinkedList? {
        var temp = head?.next
        head?.next = head?.prev
        head?.prev = temp
        
        return temp == nil ? head : reverseLinkedSecodMethod(&temp)
    }
    
     func displayData(_ doublyLinkedList:inout DoublyLinkedList?) {
        while doublyLinkedList != nil {
            print(doublyLinkedList!.data)
            doublyLinkedList = doublyLinkedList?.next
        }
    }
}

var doublyLinked:DoublyLinkedList? = DoublyLinkedList(5)
//doublyLinked?.insertData(5, &doublyLinked)
 
doublyLinked?.insertData(6, &doublyLinked)
  doublyLinked?.insertData(9, &doublyLinked)
  doublyLinked?.insertData(11, &doublyLinked)
 doublyLinked?.insertData(13, &doublyLinked)
doublyLinked?.insertSortedData(14, &doublyLinked)
doublyLinked?.insertSortedData(4, &doublyLinked)
doublyLinked?.insertSortedData(7, &doublyLinked)
doublyLinked?.insertSortedData(10, &doublyLinked)
//doublyLinked?.displayData(&doublyLinked)

doublyLinked?.reverseLinkedList(&doublyLinked)
