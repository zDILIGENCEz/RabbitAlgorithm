class Node: Equatable {
    
    var nextNode: Node?
    var value: Int?
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.nextNode == rhs.nextNode &&
            lhs.value == rhs.value
    }
    
}

var node1 = Node()
var node2 = Node()
var node3 = Node()
var node4 = Node()
var node5 = Node()
var node6 = Node()
var node7 = Node()

node1.nextNode = node2
node2.nextNode = node3
node3.nextNode = node4
node4.nextNode = node5
node5.nextNode = node6
node6.nextNode = node7
node7.nextNode = node3

var slowNode = node1
var fastNode = node1
var loopLenght = 0
var loopStartNode = Node()

func nodeStep() {
    guard let nextSlowNode = slowNode.nextNode,
        let nextFastNode = fastNode.nextNode?.nextNode else { return } // Сообщение о том что петель нет
    slowNode = nextSlowNode
    fastNode = nextFastNode
    guard slowNode === fastNode else {
        nodeStep()
        return
    }
}

func countLoopLenght() {
    guard let nextSlowNode = slowNode.nextNode else { return }
    slowNode = nextSlowNode
    loopLenght += 1
    guard slowNode === loopStartNode else {
        countLoopLenght()
        return
    }
}

nodeStep()
loopStartNode = slowNode
countLoopLenght()

print(loopLenght)
