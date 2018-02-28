//
//  AlarmActivite.swift
//  Swift Project
//
//  Created by Melvil on 26/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class AlarmActivite: UIViewController {
    
    @IBOutlet weak var labelActivite: UILabel!
    var nomActivite = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivite.text = nomActivite
    }
}
