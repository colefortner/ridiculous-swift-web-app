import Foundation
import Vapor

class ProductService {
    var products: [Product] = []
    
    //
    // Initialise our products.
    // This is a mock that returns hard coded products
    //
    init() {
        // Create some dummy products
        let toucan = Product(
            id: 1,
            name: "Toucan",
            price: 50.00,
            description: "Famous bird of the zoo"
        )
        
        let elephant = Product(
            id: 2,
            name: "Elephant",
            price: 85.00,
            description: "Large creature from Africa"
        )
        
        let giraffe = Product(
            id: 3,
            name: "Giraffe",
            price: 65.00,
            description: "Long necked creature"
        )
        
        // Add them to our products array
        products.append(toucan)
        products.append(elephant)
        products.append(giraffe)
    }
    
    //
    // Filter our products array and get by matching id
    //
    func getProductById(id: Int) -> Product? {
        return products.first(where: { $0.id == id })
    }
    
    //
    // Return all products
    //
    func getProducts() -> [Product] {
        return products
    }
}

extension Application {
    
    //
    // Register our product service with the Vapor     
    // application. 
    // 
    var productService: ProductService {
        .init()
    }
}