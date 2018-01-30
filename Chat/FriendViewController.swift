//
//  FriendViewController.swift
//  Chat
//
//  Created by Ahmed on 12/27/17.
//  Copyright © 2017 Ahmed. All rights reserved.
//

import UIKit
import MapKit


class FriendViewController: UIViewController, MKMapViewDelegate,UITextFieldDelegate {
@IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var MapView: MKMapView!
    var artworks: [Artwork] = []
    
    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    
    let regionRadius: CLLocationDistance = 10000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        MapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.delegate = self
       // loadInitialData()
       // MapView.addAnnotations(artworks)
        // show artwork on map
        centerMapOnLocation(location: initialLocation)
       
        
        var artwork = Artwork(title: "Serdah",
                              locationName: "Friends",
                              discipline: "Friends",
                              coordinate: CLLocationCoordinate2D(latitude: 21.306108, longitude: -157.852555))

        artwork.imageName = "Group 5"

          artworks.append(artwork)
         artwork = Artwork(title: "Salah",
                              locationName: "Family",
                              discipline: "Family",
                              coordinate: CLLocationCoordinate2D(latitude: 21.256139, longitude: -157.804769))
        artwork.imageName = "Rectangle"
        artworks.append(artwork)
        

         artwork = Artwork(title: "Sarah",
                              locationName: "Friends",
                              discipline: "Friends",
                              coordinate: CLLocationCoordinate2D(latitude: 21.290959, longitude: -157.851265))
        artwork.imageName = "Group 5"

        artworks.append(artwork)

         artwork = Artwork(title: "Ahmed",
                              locationName: "Friends",
                              discipline: "Friends",
                              coordinate: CLLocationCoordinate2D(latitude: 21.273389, longitude: -157.823802))
        artworks.append(artwork)

         artwork = Artwork(title: "Jon",
                              locationName: "Best Friends",
                              discipline: "Best Friends",
                              coordinate: CLLocationCoordinate2D(latitude: 21.290824, longitude: -157.85131))
        artwork.imageName = "Rectangle 26"

        artworks.append(artwork)

         artwork = Artwork(title: "JMojhon",
                              locationName: "Family",
                              discipline: "Family",
                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831641))
        artwork.imageName = "Rectangle"

        artworks.append(artwork)
        
        print(artworks.count)
       // loadInitialData()
        //MapView.addAnnotations(artworks)
        MapView.register(ArtworkMarkerView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
       MapView.register(ArtworkView.self,forAnnotationViewWithReuseIdentifier:MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        MapView.addAnnotations(artworks)
        
      

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadInitialData() {
        // 1
        guard let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json")
            else { return }
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
        
        guard
            let data = optionalData,
            // 2
            let json = try? JSONSerialization.jsonObject(with: data),
            // 3
            let dictionary = json as? [String: Any],
            // 4
            let works = dictionary["data"] as? [[Any]]
            else { return }
        // 5
        let validWorks = works.flatMap { Artwork(json: $0) }
        artworks.append(contentsOf: validWorks)
    }
    
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        if(searchTextField.text != ""){
        let searchResults = artworks.filter { annotation in
            return (annotation.title?.localizedCaseInsensitiveContains(searchTextField.text!) ?? false)
        }
        MapView.removeAnnotations(artworks)
        MapView.addAnnotations(searchResults)
        }
        else{
         MapView.addAnnotations(artworks)
        }
        //print(searchResults.count)
        
    }
    
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if(searchTextField.text != ""){
                let searchResults = artworks.filter { annotation in
                    return (annotation.title?.localizedCaseInsensitiveContains(searchTextField.text!) ?? false)
                }
                MapView.removeAnnotations(artworks)
                MapView.addAnnotations(searchResults)
            }
            else{
                MapView.addAnnotations(artworks)
            }
            return true
    }
    

    
}
