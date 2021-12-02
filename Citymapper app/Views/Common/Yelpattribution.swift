//
//  Yelpattribution.swift
//  Citymapper app
//
//  Created by Luke Davis on 01/12/2021.
//

import SwiftUI

struct Yelpattribution: View {
    
    var link : String
    
    var body: some View {
        
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
        
    }
}


