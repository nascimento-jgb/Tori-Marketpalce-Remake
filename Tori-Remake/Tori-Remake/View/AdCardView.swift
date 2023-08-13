//
//  AdView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct AdCardView: View {
    
    var body: some View {
        
        NavigationLink(destination: AdInfoView()){
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .frame(width: 400, height: 180)
                    .onTapGesture {
                        print("Outter Card tapped")
                    }
                
                HStack{
                    Image("Shirt")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 200)
                        .padding(.leading, 1)
                        .contentShape(Rectangle())

                    VStack{
                        HStack{
                            Text("Cool T-Shirt")
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
                                Text("Location")
                            }
                            .padding(1)
                            
                            HStack {
                                Image(systemName: "calendar")
                                Text("Date")
                            }
                            
                        }
                        .padding(.leading, -95)
                        .font(.title3)
                        .padding(5)
                        
                        HStack{
                            Spacer ()
                            Text("200 $")
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

struct AdCardView_Previews: PreviewProvider {
    static var previews: some View {
        AdCardView()
    }
}

