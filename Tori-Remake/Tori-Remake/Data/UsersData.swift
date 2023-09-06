//
//  UsersData.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 14.8.2023.
//

import Foundation

final class UserData : ObservableObject {
    @Published var users: [User]
    static let shared = UserData()
    
    private init() {
        users = [user1, user2, user3]
    }
}

let user1 = User(id: UUID(),
                 name: "John Doe",
                 email: "123@gmail.com",
                 password: "123",
                 accountCreationDate: randomDate(),
                 listOfAdds: [
                    Product(id: UUID(),
                            name: "iPhone 13",
                            price: 799.99,
                            imageUrl: "iphone13",
                            location: "Helsinki",
                            postingDate: randomDate(),
                            category: "Electronics",
                            info: "Introducing the iPhone 13, a pinnacle of innovation and sophistication in the realm of smartphones. Its sleek design and cutting-edge technology redefine the mobile experience. The Super Retina XDR display offers vibrant colors and deep blacks for an unmatched visual journey. Powered by the A15 Bionic chip, this device boasts lightning-fast performance, making multitasking seamless and delivering smooth, lag-free gaming and app usage. The dual-camera system, featuring advanced sensors and functions like Night mode, Deep Fusion, and Smart HDR 4, ensures exceptional photos and videos. With 5G connectivity, enjoy lightning-fast speeds for quick downloads, seamless streaming, and uninterrupted video calls. All of this, combined with the power of iOS 15, makes the iPhone 13 the ultimate choice for those seeking the best in both form and function.",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                 ],
                 listOfFavorites: [])

let user2 = User(id: UUID(),
                 name: "Jane Smith",
                 email: "janesmith@gmail.com",
                 password: "janesmith",
                 accountCreationDate: randomDate(),
                 listOfAdds: [
                    Product(id: UUID(),
                            name: "Mountain Bike",
                            price: 499.99,
                            imageUrl: "mountainBike",
                            location: "Tampere",
                            postingDate: randomDate(),
                            category: "Leisure & Hobbies",
                            info: "Introducing our Mountain Bike, an embodiment of rugged versatility and unmatched performance in the world of off-road cycling. This exceptional bike is designed to conquer any terrain and elevate your outdoor adventures. Featuring a durable frame crafted from high-quality materials, our Mountain Bike ensures longevity and reliability. The advanced suspension system offers a smooth and comfortable ride, absorbing shocks and bumps to keep you in control on rough terrain.",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                    Product(id: UUID(),
                            name: "Cozy Sofa",
                            price: 1599.99,
                            imageUrl: "cozySofa",
                            location: "Turku",
                            postingDate: randomDate(),
                            category: "Home & Living",
                            info: "Introducing our Cozy Sofa, the epitome of comfort and style for your living space. This sofa is designed to transform your home into a haven of relaxation and sophistication. Crafted with meticulous attention to detail, our Cozy Sofa boasts a timeless design that seamlessly complements any décor. Sink into its plush cushions and experience unparalleled comfort and support.",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                    Product(id: UUID(),
                            name: "Classic T-Shirt",
                            price: 29.99,
                            imageUrl: "Shirt",
                            location: "Vantaa",
                            postingDate: randomDate(),
                            category: "Other",
                            info: "Introducing our Classic T-Shirt – a timeless wardrobe essential. Crafted with care, it combines comfort and style effortlessly. With its versatile design, soft fabric, and impeccable fit, this classic tee is a must-have for any wardrobe. Elevate your everyday style with our Classic T-Shirt.",
                            typeOfSale: "For Sale",
                            size: "size M"),
                 ],
                 listOfFavorites: [])

let user3 = User(id: UUID(),
                 name: "testUser",
                 email: "1test@gmail.com",
                 password: "test",
                 accountCreationDate: randomDate(),
                 listOfAdds: [
                    Product(id: UUID(),
                            name: "Dinner Table",
                            price: 22499.99,
                            imageUrl: "dinnerTable",
                            location: "Helsinki",
                            postingDate: randomDate(),
                            category: "Home & Living",
                            info: "Presenting our Dinner Table, a symbol of elegance and functionality for your dining space. Meticulously designed and expertly crafted, this table seamlessly blends form and function. Its timeless design complements any dining room decor, while its sturdy construction ensures durability. Whether you're hosting a formal dinner or enjoying everyday meals, our Dinner Table provides the perfect setting for memorable moments with family and friends. Upgrade your dining experience with the sophistication and versatility of our Dinner Table.",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                    Product(id: UUID(),
                            name: "Dock Martens",
                            price: 199.99,
                            imageUrl: "dockMartens",
                            location: "Turku",
                            postingDate: randomDate(),
                            category: "Other",
                            info: "Introducing our Doctor Martens Boots, a timeless icon in footwear fashion. These boots are more than just a pair of shoes; they're a statement of individuality and attitude. Crafted with precision and enduring craftsmanship, our Doctor Martens Boots are built to last. They blend classic style with durability, making them a staple in any wardrobe.",
                            typeOfSale: "For Sale",
                            size: "41"),
                    Product(id: UUID(),
                            name: "Porsche 911",
                            price: 114999.99,
                            imageUrl: "porsche911",
                            location: "Helsinki",
                            postingDate: randomDate(),
                            category: "Vehicles",
                            info: "Introducing the Porsche 911 Vintage, a timeless masterpiece that encapsulates the essence of automotive excellence. This iconic classic is a testament to Porsche's heritage and commitment to unparalleled craftsmanship. With its distinctive silhouette and elegant lines, the Porsche 911 Vintage commands attention on the road. Its vintage charm is complemented by modern engineering, delivering a driving experience that combines nostalgia with cutting-edge performance.",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                 ],
                 listOfFavorites: [])

func randomDate() -> Date {
    let currentDate = Date()
    
    let randomTimeInterval = TimeInterval(arc4random_uniform(UInt32(365 * 24 * 60 * 60))) // Random interval within a year (in seconds)
    return currentDate.addingTimeInterval(randomTimeInterval)
}
