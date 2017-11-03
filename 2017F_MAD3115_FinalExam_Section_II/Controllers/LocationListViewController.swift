//
//  LocationListViewController.swift
//  2017F_MAD3115_FinalExam_Section_II
//
//  Created by moxDroid on 2017-11-02.
//  Copyright © 2017 moxDroid. All rights reserved.
//  Roll No.    :
//  Name        :

import UIKit

class LocationListViewController: UIViewController {
    
    var locationArray = [Location]()
    @IBOutlet weak var locationTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationArray = Location.getLocationList()
        
        self.locationTableView.dataSource = self
        self.locationTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mapVC = segue.destination as? ShowLocationOnMapViewController {
            let loc = locationArray[(locationTableView.indexPathForSelectedRow?.row)!] as Location
            
            mapVC.location = loc
        }
    }
}
extension LocationListViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationNameCell")!
        let loc = locationArray[indexPath.row] as Location
        cell.textLabel?.text = loc.locationName
        
        return cell
    }
}

extension LocationListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showLocationVC", sender: self)
    }
}
