//
//  SecondViewController.swift
//  Apoio
//
//  Created by Jennifer Yen on 3/3/18.
//  Copyright © 2018 jenyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var destinationTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if let destinationName = destinationTextField.text {
            
            let trip = Trip(title: destinationName)
            // this method will trigger func prepare(for segue: UIStoryboardSegue, sender: Any?) and pass your object
            performSegue(withIdentifier: "segueToPlannerTVCID", sender: trip)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPlannerTVCID" {
            let destinationVC = segue.destination as! PlanerTableViewController
            destinationVC.trip = sender as? Trip
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
