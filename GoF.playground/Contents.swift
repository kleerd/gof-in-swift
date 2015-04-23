/*:
# GoF in Swift
*/

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
