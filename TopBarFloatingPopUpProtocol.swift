//
//  TopBarFloatingPopUpProtocol.swift
//  MeshApp
//
//  Created by Alberto García-Muñoz on 10/02/2019.
//  Copyright © 2019 AlbGarciam. All rights reserved.
//

import Foundation

public protocol TopBarFloatingPopUpDelegate : AnyObject {
    func didDisappear(_ popUp: TopBarFloatingPopUp)
    func willDisappear(_ popUp: TopBarFloatingPopUp)
    func didAppear(_ popUp: TopBarFloatingPopUp)
    func willAppear(_ popUp: TopBarFloatingPopUp)
}

public extension TopBarFloatingPopUpDelegate {
    func didDisappear(_ popUp: TopBarFloatingPopUp) {}
    func willDisappear(_ popUp: TopBarFloatingPopUp) {}
    func didAppear(_ popUp: TopBarFloatingPopUp) {}
    func willAppear(_ popUp: TopBarFloatingPopUp) {}
}


