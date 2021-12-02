//
//  ContentView.swift
//  Citymapper app
//
//  Created by Luke Davis on 20/11/2021.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model : ContentModel
    var body: some View {
        
        // detect authorization status of user
        if model.authorizationState == .notDetermined {
            
            //if undetermined show onboarding
            OnboardingView()
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
            //if approved show homeview
            HomeView()
            
        }
        else {
            //denied view
            LocationDeniedView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
  
