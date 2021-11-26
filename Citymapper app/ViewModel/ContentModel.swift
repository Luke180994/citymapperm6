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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var resturaunts = [Business]()
    @Published var sights = [Business]()
    
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
        
        //update authorization state property
        authorizationState = locationManager.authorizationStatus
        
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
        let userLocation = locations.first
        if userLocation != nil {
            
            // we have a location
            
            //stop updating the location after first use
            locationManager.startUpdatingLocation()
            
            //if we have the location of the user send to yelp api
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.resturauntsKey, location: userLocation!)
            
        }
    }
    //yelp api methods
    func getBusinesses(category:String, location: CLLocation) {
        
       // create URL
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
        
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        let url = urlComponents?.url
        
        if let url = url {
        
        //create url request
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey) ", forHTTPHeaderField: "Authorization")
        
        //get url session
        let session = URLSession.shared
        
        //get data task
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            // check there is no errors
            if error == nil{
                print(response!)
                
                // parse json
                do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data!)
                    
                    DispatchQueue.main.async {
                        
                        //assign results
                        switch category {
                        case Constants.sightsKey:
                            self.sights = result.businesses
                        case Constants.resturauntsKey:
                            self.resturaunts = result.businesses
                        default:
                            break
                        }
                    }
                }
                catch {
                    print(error)
                }
            }
        }
        //start data task
        dataTask.resume()
            
        }
    }
    
}


