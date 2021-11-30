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
    @State var selectedBusiness: Business?
    
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
                    
                    ZStack(alignment: .top){
                        
                        //shop map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                //create a business detail view instance
                                //pass in selected busniess
                                BusinessDetailView(business: business)
                            }
                        
                        ZStack(){
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack(){
                                
                                Image(systemName: "location")
                                Text("San Fransisco")
                                Spacer()
                                Button("Switch to list view"){
                                    self.isMapShowing = false
                                }
                                
                            }.padding()
                            
                        }.padding()
                        
                    }.navigationBarHidden(true)
                }
            }
            
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
