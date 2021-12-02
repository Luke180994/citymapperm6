//
//  LocationDeniedView.swift
//  Citymapper app
//
//  Created by Luke Davis on 01/12/2021.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColour = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Spacer()
            
            Text("Whoops!")
                .bold()
                .font(.title)
            
            Text("We need to access your location to give you the best experience with all the venues in your area")
                
            Spacer()
            
            Button {
                // open settings
                if let url = URL(string: UIApplication.openSettingsURLString){
                 if UIApplication.shared.canOpenURL(url){
                   //if we can open this settings url the open it
                     UIApplication.shared.open(url, options: [:], completionHandler: nil)
                 }
               }
                
            } label: {
                
                ZStack(){
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                Text("Go to settings!")
                    .bold()
                    .foregroundColor(backgroundColour)
                    .padding()
                    
                }
            }.padding()

            Spacer()
            
            
        }
        .padding()
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
            .background(backgroundColour)
            .ignoresSafeArea()
        
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
