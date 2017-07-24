//
//  ViewController.swift
//  LayoutWithDynamicConstraints
//
//  Created by Marlon David Ruiz Arroyave on 7/22/17.
//  Copyright © 2017 mruiz723. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    //MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebView()
        
        let initialLocation = CLLocation(latitude: 6.27053, longitude: -75.57211999999998)
        centerMapOnLocation(location: initialLocation)
            
    }

    
    func centerMapOnLocation(location: CLLocation) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(6.27053, -75.57211999999998)
        annotation.title = "Medellín"
        
        mapView.addAnnotation(annotation)
        
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        let adjustedRegion = mapView.regionThatFits(coordinateRegion)
        mapView.setRegion(adjustedRegion, animated: true)
    }

    
    //MARK: - Utils
    func loadWebView() {
        let url = URL(string: "https://stackoverflow.com")
        let request = URLRequest.init(url: url!)
        webView.loadRequest(request)
    }
    
    
    //MARK: - UIWebViewDelegate
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Error webview: ", error.localizedDescription)
    }
    
}

