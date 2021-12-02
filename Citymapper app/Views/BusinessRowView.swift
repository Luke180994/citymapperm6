//
//  BusinessRowView.swift
//  Citymapper app
//
//  Created by Luke Davis on 27/11/2021.
//

import SwiftUI

struct BusinessRowView: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
       
        VStack(alignment: .leading){
            
            HStack(){
                
                //image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
      
                
                //name and distance
                VStack(alignment: .leading){
                    
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format: "%.1f Meters away", (business.distance ?? 0)))
                    
                    
                }
                Spacer()
                
                VStack(alignment: .leading){
                    
                    //star rating and number of reviews
                    
                    Image("regular_\(business.rating ?? 0)")
                    Text("\(business.reviewCount ?? 0) Reviews").font(.caption)
                }
                
            }
            DashDivider()
        }
        .foregroundColor(.black)
        
    }
}


