//
//  SectionCode.swift
//  Citymapper app
//
//  Created by Luke Davis on 26/11/2021.
//

import SwiftUI

struct SectionCode: View {
    
    @EnvironmentObject var model: ContentModel
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        
        Section(header: SectionHeaders(title: title)){
            ForEach(businesses) {
                business in
                
                NavigationLink(destination: BusinessDetailView(business: business)){
                
                BusinessRowView(business: business)
                    
                }
            }
        }
    }
}
