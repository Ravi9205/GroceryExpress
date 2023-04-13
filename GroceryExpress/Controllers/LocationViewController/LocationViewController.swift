//
//  LocationViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 21/03/23.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {
    
    @IBOutlet weak var mapView:MKMapView!
    
    @IBOutlet weak var bottomTitleLabel: UILabel!
    
    @IBOutlet weak var upperTitleLabel: UILabel!
    lazy var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.distanceFilter = 10
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMapView()
        updateLocation()
    }
    
    private func setupMapView(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func updateLocation(){
        guard let currentLocation = locationManager.location
        else { return }
        
        currentLocation.lookUpLocationName { [weak self] (name) in
            self?.updateLocationOnMap(to: currentLocation, with: name)
        }
    }
    
    @IBAction func changeButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func confirmLocationButtonPressed(_ sender: Any) {
        redirectToHomeVc()
    }
    
    
    private func redirectToHomeVc(){
        guard let tabViewController =
                storyboard?.instantiateViewController(withIdentifier: "TabController") as?  UITabBarController else {
                    return
                }
        view.window?.rootViewController = tabViewController
        view.window?.makeKeyAndVisible()
    }
}

//MARK:- CLLocationManager Delegate
extension LocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first
        else { return }
        
        location.lookUpLocationName { [weak self] (name) in
            self?.updateLocationOnMap(to: location, with: name)
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func updateLocationOnMap(to location: CLLocation, with title: String?) {
        
        let point = MKPointAnnotation()
        point.title = title
        point.coordinate = location.coordinate
        self.mapView.removeAnnotations(self.mapView.annotations)
        self.mapView.addAnnotation(point)
        
        let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        self.mapView.setRegion(viewRegion, animated: true)
        
        DispatchQueue.main.async {
            self.upperTitleLabel.text = title
            self.bottomTitleLabel.text = title
        }
    }
    
}

