//
//  TopBarFloatingPopUpAppereance.swift
//  MeshApp
//
//  Created by Alberto García-Muñoz on 10/02/2019.
//  Copyright © 2019 AlbGarciam. All rights reserved.
//

import UIKit

public class TopBarFloatingPopUpAppereance {
    public static let shared: TopBarFloatingPopUpAppereance = TopBarFloatingPopUpAppereance()
    private init() {}
    
    public var font: UIFont = .systemFont(ofSize: 14)
    public var textColor: UIColor = .black
    public var animationDuration : TimeInterval = 0.75
}
