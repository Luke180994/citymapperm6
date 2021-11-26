//
//  HomeView.swift
//  Citymapper app
//
//  Created by Luke Davis on 23/11/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    
    var body: some View {
        
        if model.resturaunts.count != 0 || model.sights.count != 0 {
            
            // determine if we should show list or map
            if !isMapShowing {
                //show list
                
                VStack(){
                    
                    HStack(){
                        
                        Image(systemName: "location")
                        Text("San Fransisco")
                        Spacer()
                        Text("Switch to map view")
                        
                    }.padding()
                    Divider()
                }
                BusinessList()
            }
            else{
                //shop map
            }
        }
        else {
        ProgressView()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
