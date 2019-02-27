import Foundation

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
    
    private var set: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        if let value = set[element] {
            set[element] = value + 1
        } else {
            set[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        set[element] = nil
        
    }
    
    subscript(_ member: Element) -> Int {
        return set[member] ?? 0
    }
    
    func count() -> Int? {
        return set.count
    }
}

var newCountedSet = CountedSet<String>()

newCountedSet = ["A", "B", "C"]
newCountedSet.count()
newCountedSet.remove("A")
newCountedSet.count()
newCountedSet.insert("B")
print(newCountedSet)


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet.count()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
