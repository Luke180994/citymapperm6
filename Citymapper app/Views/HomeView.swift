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
            
            NavigationView(){
                
                // determine if we should show list or map
                if !isMapShowing {
                    //show list
                    
                    VStack(){
                        
                        HStack(){
                            
                            Image(systemName: "location")
                            Text("San Fransisco")
                            Spacer()
                            Button("Switch to map view"){
                                self.isMapShowing = true
                            }
                            
                        }
                        Divider()
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else{
                    //shop map
                    BusinessMap()
                        .ignoresSafeArea()
                }
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
