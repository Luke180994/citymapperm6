//
//  OnboardingView.swift
//  Citymapper app
//
//  Created by Luke Davis on 01/12/2021.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let green = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack(){
            
            //tabview
            TabView(selection: $tabSelection) {
                
                // first tab
                VStack(spacing: 20){
                    
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Welcome to City Mapper")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Text("city mapper helps you find the best of city!")
                        .multilineTextAlignment(.center)
                    
                    
                }.tag(0)
                    .foregroundColor(.white)
                    .padding()
                
                //second tab
                VStack(spacing: 20){
                    
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    
                    
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Text("We will show you the best venues based off your location")
                        .multilineTextAlignment(.center)
                    
                }.tag(1)
                    .foregroundColor(.white)
                    .padding()
                
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            //button
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    // request geo permisson
                    model.requestGeoLocationPermisson()
                }
            } label: {
                ZStack(){
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next":"Get my location")
                        .bold()
                        .padding()
                    
                }
            }
            .padding()
            .accentColor(tabSelection == 0 ? blue : green)

        }
        .background(tabSelection == 0 ? blue : green)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
