//
//  SecondViewController.swift
//  CandySearch
//
//  Created by Mahmoud El-Melligy on 11/29/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var candyNameLabel: UILabel!
    @IBOutlet weak var candyCategoryLabel: UILabel!
    
    var candyNameSecondViewControl : String = ""
    var candyCategorySecondViewControl : String = ""
    
    var selectedCandy : [Candy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false

        
        candyNameLabel.text = candyNameSecondViewControl
        candyCategoryLabel.text = candyCategorySecondViewControl
    }


}
