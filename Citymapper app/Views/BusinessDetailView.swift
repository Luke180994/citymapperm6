//
//  BusinessDetailView.swift
//  Citymapper app
//
//  Created by Luke Davis on 27/11/2021.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business
    
    var body: some View {
       
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader(){ geometry in
                    //image at the top of detail view
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }.ignoresSafeArea(.all, edges: .top)
                //check if the business if open or closed
                ZStack(alignment: .leading){
                    
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed" : "Open" )
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            Group(){
                
                //name
                Text(business.name!)
                    .font(.largeTitle)
                //adress
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                    }
                }
                
                //rating
                Image("regular \(business.rating ?? 0)")
                
                Divider()
                
                //phone
                HStack(){
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                        .padding(.trailing)
                }
                
                Divider()
                
                //reviews
                HStack(){
                    
                    Text("Reviews:")
                        .bold()
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "tel:\(business.url ?? "")")!)
                        .padding(.trailing)
                    
                }
                
                
                Divider()
                
                //Website
                HStack(){
                Text("Website:")
                    .bold()
                Text(business.url ?? "")
                    .lineLimit(1)
                Spacer()
                Link("Visit", destination: URL(string: "tel:\(business.url ?? "")")!)
                    .padding(.trailing)
                }
            }
  
            
        }
        
        //get directions button
        Button {
           //todo: show direcrtions
        }label: {
            
            ZStack(){
                
                Rectangle()
                    .frame(height: 48)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                
                Text("Get Directions")
                    .foregroundColor(.white)
                    .bold()
                
            }
            
        }
    }
}


