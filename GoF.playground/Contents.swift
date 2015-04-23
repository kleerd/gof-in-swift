/*:
# GoF in Swift
*/

//: ## Helpers
extension Array {
    func each(each: (T) -> ()) {
        for object: T in self {
            each(object)
        }
    }
}

//: ## Singleton
class World {
    static let sharedInstance = World()
    
    func build(#name: String) {
        println("Hello \(name)!")
    }
}
func singletonMain() {
    World.sharedInstance.build(name: "John")
}
singletonMain()

//: ## Composite
protocol Entry {
    func print()
}
class Directory: Entry {
    let name: String
    var entries: Array<Entry> = []
    init(name: String) {
        self.name = name
    }
    func add(entry: Entry) {
        entries.append(entry)
    }
    func print() {
        println(name)
        entries.each { e in e.print() }
    }
}
class File: Entry {
    let name: String
    init(name: String) {
        self.name = name
    }
    func print() {
        name
    }
}
func compositeMain() {
    let root = Directory(name: "root")
    let bin = Directory(name: "bin")
    root.add(bin)
    let ls = File(name: "ls")
    bin.add(ls)
    root.print()
}
compositeMain()
