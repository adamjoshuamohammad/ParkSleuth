//
//  MapViewController.swift
//  ParkSleuth
//
//  Created by Ashley Gong on 4/24/21.
//

import UIKit
import GoogleMaps
import Alamofire
import SwiftyJSON

class MapViewController: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet var myMap: GMSMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.requestLocation()
            
            var ratings : JSON = ""
            var parkRating: String = ""
            var addresses : JSON = ""
            var full_address: String = ""
            var latitudeLongitude : JSON = ""
            var names : JSON = ""
            var parkName: String = ""
            var destinationLatitude: CLLocationDegrees = 0.0
            var destinationLongitude: CLLocationDegrees = 0.0
            //let originLatitude = locationManager.location?.coordinate.latitude
            //let originLongitude = locationManager.location?.coordinate.longitude
            
            let url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=skateparks+in+nyc&key=AIzaSyDvFkv2h6M4O1GSkR1xz_b2v5UU21Ps8zo"
                /*"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyDvFkv2h6M4O1GSkR1xz_b2v5UU21Ps8zo"*/
                /*"https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Brooklyn&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyDvFkv2h6M4O1GSkR1xz_b2v5UU21Ps8zo"*/
            
            AF.request(url).responseJSON{(AFResponse) in
                
                guard let JSONData = AFResponse.data else {
                    return
                }
                
                do{
                    if let jMapData = try? JSON(data: JSONData)
                    {
                        //fetching latitude and longitude
                        for oCandidate in jMapData["results"].arrayValue
                        {
                            for location in oCandidate
                            {
                                for latlong in location.1
                                {
                                    if(latlong.0.description == "location")
                                    {
                                        latitudeLongitude = latlong.1
                                        destinationLatitude = latitudeLongitude.dictionaryValue["lat"]?.doubleValue ?? 0.0
                                        print(destinationLatitude)
                                        destinationLongitude = latitudeLongitude.dictionaryValue["lng"]?.doubleValue ?? 0.0
                                        print(destinationLongitude)
                                        for address in oCandidate
                                        {
                                            if (address.0.description == "formatted_address")
                                            {
                                                addresses = address.1
                                                full_address = addresses.stringValue
                                            }
                                        }
                                        for name in oCandidate
                                        {
                                            if (name.0.description == "name")
                                            {
                                                names = name.1
                                                //print(parkName)
                                                parkName = names.stringValue
                                                
                                                let marker = GMSMarker()
                                                marker.position = CLLocationCoordinate2D(latitude: destinationLatitude, longitude: destinationLongitude)
                                                
                                                marker.title = parkName
                                                marker.snippet = full_address
                                                print(parkName)
                                                    
                                                marker.map = self.myMap
                                            }
                                        }
                                        for rating in oCandidate
                                        {
                                            if (rating.0.description == "rating")
                                            {
                                                ratings = rating.1
                                                print(ratings)
                                                parkRating = ratings.stringValue
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        }
                    }
                }
            }
        
        else
        {
            locationManager.requestWhenInUseAuthorization()
        }
        
    
        /*
        let url = URL(string:"https://maps.googleapis.com/maps/api/place/textsearch/json?query=skateparks+in+nyc&key=[key]")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
         if let error = error {
                print(error.localizedDescription)
         } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                print(dataDictionary)
            
                // Get array of parks
                // Store parks in a property
                // Reload mapview and display parks
         }
        }
        task.resume()
        */
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        myMap.camera = GMSCameraPosition(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0,
            zoom: 6,
            bearing: 0,
            viewingAngle: 0)
        
        let marker = GMSMarker()
        marker.icon = GMSMarker.markerImage(with: UIColor.green)
        marker.position = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
        
        marker.title = "You are here"
        marker.snippet = "Your Current Location"
        marker.map = myMap
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            return
        case .authorizedWhenInUse:
            return
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
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

