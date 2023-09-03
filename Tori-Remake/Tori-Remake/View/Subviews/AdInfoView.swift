//
//  AdInfoView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct AdInfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var coreUser: CoreUser
    @ObservedObject var coreProduct: CoreProduct
    
    
    var body: some View {
        
        VStack{
            ZStack{
                Image(coreProduct.imageInfo ?? "")
                    .resizable()
                    .scaledToFit()
                    
                HStack {
                    Spacer()
                    
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                            .padding(4)
                            .padding(.trailing, 3)
                        
                        Image(systemName: "heart")
                            .padding(.trailing, 18)
                            .padding(.bottom, -6)
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                }
                .padding(.top, -200)
                .padding(.trailing, 14)
            } //ZStack
            
            Spacer()
            
            ScrollView(.vertical)
            {
                VStack{
                    
                    Text(coreProduct.name ?? "")
                        .customFont(.title).bold()
                            .padding(.leading, -160)
                            .padding(.bottom, 2)
                            .padding(.top, 2)
                    
                    Text("€ \(String(format: "%.2f", coreProduct.price))")
                        .customFont(.title3).bold()
                            .padding(.leading, -160)
                            .padding(.bottom, 12)
                    
                    HStack{
                        Spacer()
                        HStack{
                            Image(systemName: "calendar")
                                .foregroundColor(Constants.Colors.primaryColor)
                            Text(dateFormatter.string(from: coreProduct.postingDate!))
                                .customFont(.title3)
                                .padding(.bottom, 2)
                        }
                    
                        Spacer()
                        
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(Constants.Colors.primaryColor)
                            Text(coreProduct.location ?? "")
                                .customFont(.title3)
                                .padding(.bottom, 2)
                        }
                        .padding(.leading, -90)
                        Spacer()
                    }
                    .padding(.bottom, 8)
                        
                    HStack{
                        Text(coreProduct.category ?? "")
                            .padding(.leading, 25)
                        Spacer()
                        Image(systemName: "circle.fill")
                            .font(.system(size: 4))
                            .foregroundColor(Constants.Colors.primaryColor)
                        Spacer()
                        Text(coreProduct.typeOfSale ?? "")
                        Spacer()
                        Image(systemName: "circle.fill")
                            .font(.system(size: 4))
                            .foregroundColor(Constants.Colors.primaryColor)
                        Spacer()
                        Text(coreProduct.size ?? "")
                            .padding(.trailing, 25)
                        }
                        .customFont(.body).bold()
                        .padding(.bottom, 15)
                    
                    Text(coreProduct.info ?? "")
                        .customFont(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 25)
                        .padding(.trailing, 15)
                        .padding(1)
                    
                    Text("Information of the seller:")
                            .customFont(.body).bold()
                            .padding(.top, 3)
                            .padding(1)
     
                    Text(coreUser.name ?? "")
                            .customFont(.title2)
                            .multilineTextAlignment(.leading)
                    
                    Text("Account created in \(dateFormatter.string(from: coreUser.accountCreationDate!))")
                            .customFont(.title3)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 6)
                    
                    Button(action: {
                        //Action to show all ads/products being displayed by the seller
                    })
                    {
                        HStack {
                            Spacer()
                            Text("Show all adds")
                                .customFont(.headline)
                                .underline()
                                .padding(.horizontal, 10)
                            Image(systemName: "arrow.up.left.and.arrow.down.right")
                            Spacer()
                        }
                        .foregroundColor(.black)
                       
                    }
                }
                //VStack
            }//Scrollview
            
            VStack {
                    Spacer()
                    Button(action: {
                        // Action for the message button
                    }) {
                        Text("Send Message")
                            .customFont(.title3)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45) // Adjust the height as needed
                            .background(Constants.Colors.primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding()
            }
            .frame(height: 50)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {
            presentationMode.wrappedValue.dismiss()
            }))
    }
}

struct BackButton: View {
            
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                Text("")
            }
        }
    }
}


struct AdInfoView_Previews: PreviewProvider {
    
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
            product.info = "Latest iPhone model Latest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone modelLatest iPhone model"
            product.typeOfSale = "For Sale"
            product.size = "No Size"
            
            user.addToAddedProducts(product)
            
            return AdInfoView(coreUser: user, coreProduct: product)
                .environment(\.managedObjectContext, CoreDataManager.shared.managedObjectContext)
        }
    }
