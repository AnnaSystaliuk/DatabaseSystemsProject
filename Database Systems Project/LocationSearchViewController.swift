//
//  LocationSearchViewController.swift
//  Database Systems Project
//
//  Created by Anna on 4/12/20.
//  Copyright © 2020 Anna Systaliuk. All rights reserved.
//

import UIKit
import MapKit

class LocationSearchViewController: UIViewController, UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet weak var SearchDestination: UITextField!
    @IBOutlet weak var LocationResults: UITableView!
    
    var searchResults:[MKMapItem] = []
    
    var myMapRegion:MKCoordinateRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        LocationResults.delegate = self
        LocationResults.dataSource = self
        SearchDestination.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SearchDestination.becomeFirstResponder()
        
   
    }

    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //to make a keyboard disappear
        textField.resignFirstResponder()
        
        //search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = textField.text
        searchRequest.region = myMapRegion
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            self.searchResults.removeAll()

            for item in response.mapItems {
                self.searchResults.append(item)
                print(item.name ?? "No phone number.")
            }
            
            self.LocationResults.reloadData()
        }

        
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.frame = .init(origin: .zero, size: .init(width: tableView.frame.width, height: 100))
        
        cell.textLabel?.text = searchResults[indexPath.row].name
        
        return cell

       }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = searchResults[indexPath.row]
    }
       
}
