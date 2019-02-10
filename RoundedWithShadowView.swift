//
//  RoundedWithShadowView.swift
//  MeshApp
//
//  Created by Alberto García-Muñoz on 10/02/2019.
//  Copyright © 2019 AlbGarciam. All rights reserved.
//

import UIKit

public class RoundedWithShadowView: UIView {
    var roundedLayer: CALayer?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        addRoundLayer()
        addShadow()
    }
    
    func addRoundLayer() {
        if roundedLayer == nil {
            let layer = CALayer()
            let firstSubLayer = subviews.first?.layer ?? layer
            self.layer.insertSublayer(layer, below: firstSubLayer)
            layer.backgroundColor = UIColor.white.cgColor
            layer.masksToBounds = true
            layer.cornerRadius = 5
            roundedLayer = layer
        }
        roundedLayer?.frame = bounds
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.gray.withAlphaComponent(0.75).cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
        backgroundColor = .clear
        clipsToBounds = false
    }
}
