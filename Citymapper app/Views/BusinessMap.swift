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
    @Binding var selectedBusiness : Business?
    
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
        mapView.delegate = context.coordinator
        
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
    
    // coordinator class
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap){
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            //if annotation is the blue dot renturn nill
            if annotation is MKUserLocation {
                return nil
            }
            
            //check if ther eis a reusable annotation view first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil {
                
                //create an annotation view
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                //we have a reusable one
                annotationView!.annotation = annotation
            }
            //return it
            return annotationView
            
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            //user tapped on (i)
            
            // get business object
            //loop through businesses to find a match
            for business in map.model.resturaunts + map.model.sights {
                
                if business.name == view.annotation?.title {
                    
                    //set the selected business property to the object
                    
                    map.selectedBusiness = business
                    return
                    
                }
                
            }
        }
        
    }
}
