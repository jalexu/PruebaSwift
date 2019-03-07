//
//  ViewController.swift
//  PruebaSwift
//
//  Created by Jaime Uribe on 3/6/19.
//  Copyright © 2019 Jaime Uribe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "inicioSesion", sender: self)
    }


}

