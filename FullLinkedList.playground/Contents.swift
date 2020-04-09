import UIKit

var str = "Hello, playground"


class LinkedList {
    var next:LinkedList?
    var data:Int
    
    init(_ data:Int) {
        self.data = data
        next = nil
    }
    
    func insertValueAtTop(_ data:Int, _ head:inout LinkedList?)->LinkedList {
        let temp = LinkedList(data)
        temp.next = head
        head = temp
        return head!
    }
    
    func printValue(_ head:inout LinkedList?) {
        print("hello")
        while head != nil {
            print(head!.data)
            head = head?.next
        }
    }
    
    func addAtLast(_ data:Int, _ head:inout LinkedList?) -> LinkedList {
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        let lastValue = LinkedList(data)
        temp?.next = lastValue
       
        return head!
    }
    
    func addValueAtPosition (_ data:Int, _ head:inout LinkedList?, _ postion:Int) -> LinkedList {
        var temp = head
        for _ in 1..<postion {
            
            temp = temp?.next
        }

        let newNode = LinkedList(data)
        //temp?.next = newNode
        newNode.next = temp?.next
        temp?.next = newNode
       // head = temp
        return head!
        
    }
    
    func deleteValue(at position:Int, _ head:inout LinkedList?) -> LinkedList {
        var temp:LinkedList?
        var tempHead = head
        var startHead = head
        if position == 0 {
            tempHead = tempHead?.next
            startHead = tempHead
           // head?.next = nil
            return startHead!
        }
        
        for _ in 0..<position {
            temp = tempHead
            tempHead = tempHead?.next
        }
       
        temp?.next = tempHead?.next
       
        
        
        return head!
    }
    
    func reversePrint(head: LinkedList?) -> Void {


    }
    
    func reverseValue(_ head:inout LinkedList?) -> LinkedList? {
        var pre : LinkedList? = nil
        var next : LinkedList? = nil
        
        while head != nil {
            next = head?.next
            head?.next = pre
            pre = head
            head = next
        }
        head = pre
        return head!
    }
    
    func compareTwoLinkedList(_ first:inout LinkedList?, _ second:LinkedList?) -> Int {
        var firstCount = 0;
        var secondCount = 0;
        while (first != nil && second != nil) {
            firstCount += 1
            secondCount += 1
        }
          var isVaueSame = false
        if firstCount == secondCount {
            while first != nil {
                if first?.data == second?.data {
                    isVaueSame = true
                } else {
                    isVaueSame = false
                }
            }
        } else {
            return 0;
        }
        
        if isVaueSame {
            return 1
        } else {
            return 0
        }
    }
    
    
    func duplicateValue (_ head: LinkedList?) -> LinkedList? {
        var next:LinkedList?
        var current:LinkedList? = head
        while current?.next != nil {
            if current?.data == current?.next?.data {
                next = current?.next?.next
                current?.next = nil
                current?.next = next
            } else {
                current = current?.next
            }
        }
        return current
    }
    
    func mergeSortedLinked(_ linkedList1:inout LinkedList?, _ linkedList2:inout LinkedList?) -> LinkedList {
        var arrayList:[Int] = []
        while linkedList1 != nil {
            arrayList.append(linkedList1!.data)
            linkedList1 = linkedList1?.next
        }
        
        while linkedList2 != nil {
            arrayList.append(linkedList2!.data)
            linkedList2 = linkedList2?.next
        }
        
        arrayList.sort()
        var linkedList:LinkedList? = LinkedList(arrayList[0])
        for index in 1..<arrayList.count {
            linkedList?.addAtLast(arrayList[index], &linkedList)
        }
        return linkedList ?? LinkedList(5)
    }
    
    func mergeToLinkList(_ linkedList1:inout LinkedList?, _ linkedList2:inout LinkedList?) -> LinkedList {
        let dummy : LinkedList? = LinkedList(0)
        var head = dummy
        while  true {
            if linkedList1 == nil {
                head?.next = linkedList2
                break;
            }
            
            if linkedList2 == nil {
                head?.next = linkedList1
                break;
            }
            
            if linkedList2!.data <= linkedList1!.data {
                head?.next = linkedList2
                linkedList2 = linkedList2?.next
            }
            
            else if linkedList1!.data <= linkedList2!.data  {
                head?.next = linkedList1
                linkedList1 = linkedList1?.next
            }
            
            head = head?.next
        }
        return dummy!.next!
    }
}

var linkedList: LinkedList? = LinkedList(4)


//linkedList!.insertValueAtTop(10, &linkedList)
//linkedList?.insertValueAtTop(20, &linkedList)
//linkedList?.insertValueAtTop(40, &linkedList)
linkedList?.addAtLast(5, &linkedList)
linkedList?.addAtLast(6, &linkedList)


//linkedList?.addValueAtPosition(4, &linkedList, 2)
///linkedList?.deleteValue(at: 0, &linkedList)

//linkedList = linkedList?.duplicateValue(linkedList)
////linkedList?.reverseValue(&linkedList)
//linkedList?.printValue(&linkedList)

var linkedList1:LinkedList? = LinkedList(1)
linkedList?.addAtLast(2, &linkedList1)
linkedList?.addAtLast(10, &linkedList1)


//var linked = linkedList?.mergeSortedLinked(&linkedList, &linkedList1)
var linked = linkedList?.mergeToLinkList(&linkedList, &linkedList1)
linked?.printValue(&linked)


//String program

