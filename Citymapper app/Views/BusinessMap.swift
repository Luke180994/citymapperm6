//
//  BusinessMap.swift
//  Citymapper app
//
//  Created by Luke Davis on 30/11/2021.
//

import SwiftUI
import MapKit

struct BusinessMap : UIViewRepresentable {
    
    @EnvironmentObject var model : ContentModel
    
    var locations: [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        //create a list of annotations
        for business in model.resturaunts + model.sights {
            
            // if the business has a lat and long
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                
                // create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
                
            }
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        //make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        //set the region
        
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        //removing annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // add the ones based on the business
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
        
    }
}
