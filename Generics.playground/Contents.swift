import Foundation

struct CountedSet<Element: Hashable> {
    
    private var set: [Element] = []
    
    mutating func insert(_ element: Element) {
        set.append(element)
    }
    
    mutating func remove() -> Element? {
        guard !set.isEmpty else { return nil }
        return set.removeFirst()
    }
    
    subscript(_ member: Element) -> Int {
       return member.hashValue
    }
    
    func count<Count: Hashable>() -> Count {
        let uniqueSet: [Element] = []
        var uniqueNumber = 0
        if !set.isEmpty {
            for element in set {
                if !uniqueSet.contains(element) {
                    uniqueNumber += 1
                }
            }
            return uniqueNumber as! Count
        } else {
            return set.isEmpty as! Count
        }
    }
}

