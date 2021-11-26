//
//  SectionHeaders.swift
//  Citymapper app
//
//  Created by Luke Davis on 26/11/2021.
//

import SwiftUI

struct SectionHeaders: View {
    
    var title: String
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            Rectangle()
                .foregroundColor(.white)
            
        Text(title)
                .font(.headline)
        }.padding(.bottom, 5)
    }
}


