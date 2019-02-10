//
//  ViewController.swift
//  Example
//
//  Created by Alberto García-Muñoz on 10/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import TopBarFloatingPopUp

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let model = TopBarFloatingPopUpModel(text: "Hello World!", iconImage: UIImage())
        let popup = TopBarFloatingPopUp.insert(on: self.view, model: model)
        popup.showPopUp()
    }

}

