//
//  BusinessList.swift
//  Citymapper app
//
//  Created by Luke Davis on 26/11/2021.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        ScrollView(showsIndicators: false){
            
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]){
                
                SectionCode(title: "Resturaunts", businesses: model.resturaunts)
                }
                
                Spacer()
                
            SectionCode(title: "Sights", businesses: model.sights)
                    
                }
            }
            
            
        }

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
