//
//  ContentModel.swift
//  Citymapper app
//
//  Created by Luke Davis on 22/11/2021.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    override init(){
        
        // init method of NSObject
        super.init()
        
        //set content model as delegete
        locationManager.delegate = self
        //Request authoziation
        locationManager.requestWhenInUseAuthorization()
        
        
    }
    
    //mark - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // we have permisson
            
            // start geo loacting the user
               locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied {
            
            // we dont have permisson
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        //gives the location of the user
        print(locations.first ?? "no location")
        
        //stop updating the location after first use
        locationManager.startUpdatingLocation()
        
        //TODO: if we have the location of the user send to yelp api
        
    }
    
}


