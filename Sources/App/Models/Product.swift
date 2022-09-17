import Foundation

struct Product: Codable {
    // MARK:- Properties
    public var id: Int
    private var name: String
    private var price: Double
    private var description: String
    
    // MARK:- Lifecycle
    init(id: Int, name: String, 
        price: Double, description: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
    }
    
    // MARK:- Codeable Methods
    func asJsonString() -> String {
        let codedProduct = try! JSONEncoder().encode(self)
        return String(data: codedProduct, encoding: .utf8)!
    }
}

extension Array {
    typealias CodableArray = [Product]
    
    //
    // Encode our array as a Json string.
    //
    func codableArrayAsJsonString() -> String {
        if let array = self as? CodableArray {
            let codedArray = try! 
                JSONEncoder().encode(array)

            return String(
                data: codedArray, 
                encoding: .utf8
          )!
        }
        
        // This is where we can add some error handling,
        // But for now we will just return blank
        return ""
    }
}