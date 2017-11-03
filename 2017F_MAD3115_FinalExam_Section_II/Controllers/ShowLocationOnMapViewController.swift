//
//  ShowLocationOnMapViewController.swift
//  2017F_MAD3115_FinalExam_Section_II
//
//  Created by moxDroid on 2017-11-02.
//  Copyright © 2017 moxDroid. All rights reserved.
//  Roll No.    :
//  Name        :

import UIKit
import MapKit

class ShowLocationOnMapViewController: UIViewController {

    @IBOutlet weak var myNavBar: UINavigationBar!
    var location: Location!
    @IBOutlet weak var myMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myNavBar.topItem?.title = location.locationName
        setUpMyMap()
        showMyLocation()
    }
    
    func setUpMyMap()
    {
        myMapView.showsUserLocation = true
        myMapView.isPitchEnabled = true
        myMapView.mapType = MKMapType.satellite
        myMapView.isZoomEnabled = true
        myMapView.isScrollEnabled = true
    }
    
    func showMyLocation() {
        
        let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        myMapView.setRegion(coordinateRegion, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(initialLocation.coordinate.latitude, initialLocation.coordinate.longitude);
        myAnnotation.title = location.locationName
        myMapView.addAnnotation(myAnnotation)
    }

}
