//
//  NewRideViewController.swift
//  Database Systems Project
//
//  Created by Anna on 4/12/20.
//  Copyright © 2020 Anna Systaliuk. All rights reserved.
//

import UIKit
import MapKit

class NewRideViewController: UIViewController, MKMapViewDelegate {
@IBOutlet private var mapView: MKMapView!
    override func viewDidLoad() {
        // Set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 37.336079, longitude: -121.880454)
       
        //mapView.delegate = self
        //mapView.showsUserLocation = true
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    mapView.centerToLocation(initialLocation)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSearch"{
            if let vc = segue.destination as? LocationSearchViewController{
                vc.myMapRegion = mapView.region
            }
        }
    }
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 600
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
