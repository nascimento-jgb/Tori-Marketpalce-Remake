//
//  AdView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct AdCardView: View {
    
    var user: User
    let product: Product
    
    var body: some View {
        
        NavigationLink(destination: AdInfoView(user: user, product: product)){
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .frame(width: 400, height: 180)
                
                HStack{
                    Image(product.imageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 200)
                        .padding(.leading, 1)
                        .contentShape(Rectangle())

                    VStack{
                        HStack{
                            Text(product.name)
                                .padding(.leading, -5)
                                .font(.title2)
                                .padding(1)
                                .bold()
                            
                            Spacer()
                            
                            Image(systemName: "heart")
                                .padding(.trailing, 2)
                                .font(.title3)
                                .padding(1)
                        }
                        .padding()
                        
                        VStack(alignment: .leading){
                            
                            HStack{
                                Image(systemName: "mappin.and.ellipse")
                                Text(product.location)
                            }
                            .padding(1)
                            
                            HStack {
                                Image(systemName: "calendar")
                                Text(dateFormatter.string(from: product.postingDate))
                            }
                            
                        }
                        .padding(.leading, -95)
                        .font(.title3)
                        .padding(5)
                        
                        HStack{
                            Spacer ()
                            Text("$ \(String(format: "%.2f", product.price))")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.trailing, 20)
                                .padding(.top, -15)
                            
                        }
                    }
                    .frame(height: 200)
                    
                }
            }
        }
        .buttonStyle(.plain)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short // Customize the date style as needed
    return formatter
}()

struct AdCardView_Previews: PreviewProvider {
   
    
    static var previews: some View {
        
        let user1 = User(id: UUID(),
                         name: "John Doe",
                         accountCreationDate: Date(),
                         listOfAdds: [
                            Product(id: UUID(),
                                    name: "iPhone 13",
                                    price: 799.99,
                                    imageUrl: "Shirt",
                                    location: "Helsinki",
                                    postingDate: Date(),
                                    category: "Electronics",
                                    info: "Latest iPhone model",
                                    typeOfSale: "For Sale",
                                    size: nil),
                         ],
                         listOfFavorites: [])
        
        AdCardView(user: user1, product: user1.listOfAdds[0])
    }
}

