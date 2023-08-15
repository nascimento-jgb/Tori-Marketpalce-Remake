//
//  AdView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI
import CoreData

struct AdCardView: View {
    
    let coreUser: CoreUser
    let coreProduct: CoreProduct
    
    init(coreUser: CoreUser, coreProduct: CoreProduct) {
        self.coreUser = coreUser
        self.coreProduct = coreProduct
    }
        
        var body: some View {
            
            NavigationLink(destination: AdInfoView(coreUser: coreUser, coreProduct: coreProduct)){
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .frame(width: 400, height: 180)
                    
                    HStack{
                        Image(coreProduct.imageInfo ?? "")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 200)
                            .padding(.leading, 1)
                            .contentShape(Rectangle())

                        VStack{
                            HStack{
                                Text(coreProduct.name ?? "")
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
                                    Text(coreProduct.location ?? "")
                                }
                                .padding(1)
                                
                                HStack {
                                    Image(systemName: "calendar")
                                    Text(dateFormatter.string(from: coreProduct.postingDate!))
                                }
                                
                            }
                            .padding(.leading, -95)
                            .font(.title3)
                            .padding(5)
                            
                            HStack{
                                Spacer ()
                                Text("$ \(String(format: "%.2f", coreProduct.price ))")
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
            let coreDataManager = CoreDataManager.shared
            
            let context = coreDataManager.managedObjectContext
            
            let user = CoreUser(context: context)
            user.id = UUID()
            user.name = "John Doe"
            user.accountCreationDate = Date()
            
            let product = CoreProduct(context: context)
            product.id = UUID()
            product.name = "iPhone 13"
            product.price = 799.99
            product.imageInfo = "Shirt"
            product.location = "Helsinki"
            product.postingDate = Date()
            product.category = "Electronics"
            product.info = "Latest iPhone model"
            product.typeOfSale = "For Sale"
            product.size = "No Size"
            
            user.addToAddedProducts(product)
            
            return AdCardView(coreUser: user, coreProduct: product)
                .environment(\.managedObjectContext, CoreDataManager.shared.managedObjectContext)
        }
    }


