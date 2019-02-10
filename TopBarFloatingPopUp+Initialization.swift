//
//  TopBarFloatingPopUp+Initialization.swift
//  MeshApp
//
//  Created by Alberto García-Muñoz on 09/02/2019.
//  Copyright © 2019 AlbGarciam. All rights reserved.
//

import UIKit

extension TopBarFloatingPopUp {
    /**
     Inserts a popup on the view
     
     - Parameters:
        - view: PopUp's superview
        - model: TopBarFloatingPopUpModel to be displayed
        - delegate: TopBarFloatingPopUpDelegate
     
     - Returns: PopUp which will be added on screen.
     */
    public class func insert(on view: UIView,
                             model: TopBarFloatingPopUpModel,
                             delegate: TopBarFloatingPopUpDelegate? = nil) -> TopBarFloatingPopUp {
        let popUp = TopBarFloatingPopUp(model: model)
        popUp.delegate = delegate
        popUp.label.font = TopBarFloatingPopUpAppereance.shared.font
        popUp.label.textColor = TopBarFloatingPopUpAppereance.shared.textColor
        popUp.animationDuration = TopBarFloatingPopUpAppereance.shared.animationDuration
        view.addSubview(popUp)
        return popUp
    }
    
    
}
