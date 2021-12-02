//
//  BusinessTitle.swift
//  Citymapper app
//
//  Created by Luke Davis on 01/12/2021.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
    
        VStack(alignment: .leading){
            //name
            Text(business.name!)
                .font(.title2)
                
            
            //adress
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            //rating
            Image("regular \(business.rating ?? 0)")
        }
    }
}


