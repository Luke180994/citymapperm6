//
//  DirectionsView.swift
//  Citymapper app
//
//  Created by Luke Davis on 01/12/2021.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // business title
            HStack(){
            BusinessTitle(business: business)
                Spacer()
                
                if let lat = business.coordinates?.latitude,
                   let long = business.coordinates?.longitude,
                   let name = business.name
                {
                
                    Link("Open in maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                    
                }
            }.padding()
            // directions map
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}


