//
//  AlarmActivite.swift
//  Swift Project
//
//  Created by Melvil on 26/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class AlarmActivite: UIViewController {
    @IBOutlet weak var Secondbutton: UILabel!
    var stringPassed = ""
    override func viewDidLoad() {
        Secondbutton.text = stringPassed
    }
}
