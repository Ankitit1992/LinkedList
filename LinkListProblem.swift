class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ node: Node? = nil) {
        self.data = data
        self.next = node
    }
}

func length(_ head: Node?) -> Int {
    
    var temp = head
    var count = 0
    while (temp != nil) {
        temp = temp?.next
        count += 1
    }
    return count
}

func displayData(_ head: Node?) {
    var data = [Int]()
    var temp = head
    while(temp != nil) {
        data.append(temp?.data ?? 0)
        temp = temp?.next
    }
    
    print(data)
}

func mergePointBrute(_ nodeA: Node?, _ nodeB: Node?) -> Int? { // O(m*n) > O(n*2)
    
    let m = length(nodeA) // O(m)
    let n = length(nodeB) // O(n)
    
    var currentA = nodeA
    for _ in 0..<m {    //O(m * n)
        var currentB = nodeB
        for _ in 0..<n {
            if currentA === currentB {
                return currentA?.data
            }
            currentB = currentB?.next
        }
        
        currentA = currentA?.next
    }
    return nil
}

func mergePointSpaceTime(_ nodeA: Node?, _ nodeB: Node?) -> Int? {
    let m = length(nodeA) // O(m)
    let n = length(nodeB) // O(n)
    
    var dicB = [Int: Bool]()
    var currentB = nodeB
    for _ in 0..<n { //O(n)
        dicB[currentB?.data ?? 0] = true
        currentB = currentB?.next
    }
    
    var currentA = nodeA
    for _ in 0..<m { // O(m)
        if dicB[currentA?.data ?? 0] == true {
            return currentA?.data
        }
        currentA = currentA?.next
    }
    
    return nil
}

func mergePointInsight(_ nodeA: Node?, _ nodeB: Node?) -> Int? {
    let m = length(nodeA) // O(m)
    let n = length(nodeB) // O(n)
    
    var currentA = nodeA
    var currentB = nodeB
    
    if  n > m {
        let temp = currentA
        currentA = currentB
        currentB = temp
        
    }
    
    let d = abs(m - n)
    for _ in 1...d {
        currentA = currentA?.next
    }
    
    for _ in 0..<n {
        if currentA?.data  == currentB?.data  {
            return currentB?.data
        }
        
        currentB = currentB?.next
        currentA = currentA?.next
    }
    
    
    return nil
}

func hasCycle(_ node: Node?) -> Bool {
    
    var fastNode = node
    var slowNode = node
    var count = 0
    
    while fastNode != nil && fastNode?.next != nil {
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
        count += 1
        if slowNode?.data == fastNode?.data {
            return true
        }
    }
    
    while node?.next != nil {
    }
    
    return false
}


let node5 = Node(5)
let node4 = Node(4)
let node3 = Node(3)
let node2 = Node(2)
let head = Node(1)

head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node3


hasCycle(head)
