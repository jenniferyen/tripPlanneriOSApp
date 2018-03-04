//
//  ViewController.swift
//  Apoio
//
//  Created by Jennifer Yen on 3/3/18.
//  Copyright © 2018 jenyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(DataSource.sharedInstance.trips.first?.plans.count)
    }
    
}

