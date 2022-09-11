class LinkdedList {
    private var head: Node?
    
    func addFront(_ value: Int) {
        let newNode = Node(value)
        newNode.next = head
        head = newNode
        
    }
    
    func getFirst() -> Int {
        if head == nil {return -1}
        return head?.value ?? 0
    }
    
    func addBack(_ value: Int) {
        if head == nil {
            head = Node(value)
        } else {
            var temp = head
            while (temp?.next != nil) {
                temp = temp?.next
            }
            let newNode = Node(value)
            temp?.next = newNode
        }
    }
    
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        var temp = head
        while (temp?.next != nil) {
            temp = temp?.next
        }
        return temp?.value ?? -1
    }
    
    func insert(at postion: Int, _ data: Int) {
        if postion == 0 {
            addFront(data)
            return
        } else {
            var temp = head
            var i = 1
            while i < postion {
                temp = temp?.next
                i += 1
            }
            
            let node = Node(data)
            node.next = temp?.next
            temp?.next = node
        }
    }
    
    func deleteFirst() {
        var temp = head
        head =  temp?.next
        temp?.next = nil
        temp = nil
    }
    
    func deleteLast() {
        var temp = head
        var prvNode: Node?
        while (temp?.next != nil) {
            prvNode = temp
            temp = temp?.next
        }
        
        prvNode?.next = nil
        temp = nil
    }
    
    func delete(at position: Int) {
        var temp = head
        var preNode: Node?
        var i = 1
        while i <= position {
            preNode = temp
            temp = temp?.next
            i += 1
        }
        preNode?.next = temp?.next
        temp?.next = nil
        temp = nil
    }
    
    func printLinkedList () {
        if head == nil {return}
        var node = head
        var result = [Int]()
        result.append(node?.value ?? 0)
        while node?.next != nil {
            result.append(node?.next?.value ?? 0)
            node = node?.next
        }
        print(result)
    }
    
    var isEmpty: Bool {
        return head == nil ? true : false
    }
    
    func clear() {
        head?.next = nil
        head = nil
    }
}
