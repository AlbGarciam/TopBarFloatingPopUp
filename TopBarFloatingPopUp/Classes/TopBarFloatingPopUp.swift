//
//  TopBarFloatingPopUp.swift
//  MeshApp
//
//  Created by Alberto García-Muñoz on 07/02/2019.
//  Copyright © 2019 AlbGarciam. All rights reserved.
//

import UIKit

/**
 Model which is used to create the pop up
 
 - Parameters:
    - text: Text to be displayed
    - iconImage: Left icon to be displayed
 */
public typealias TopBarFloatingPopUpModel = (text: String, iconImage: UIImage?)


public final class TopBarFloatingPopUp: RoundedWithShadowView {
    
    //MARK: Attributes
    public let leftIcon: UIImageView = UIImageView()
    public let label: UILabel = UILabel()
    public internal(set) var animationDuration: TimeInterval = 0.65
    
    public weak var delegate: TopBarFloatingPopUpDelegate?
    
    //MARK: Properties
    private var shouldUdpdateConstraints = true
    weak var topConstraint: NSLayoutConstraint?
    weak var bottomConstraint: NSLayoutConstraint?
    
    //MARK: Initializers
    convenience init(model: TopBarFloatingPopUpModel) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configureIcon(with: model.iconImage)
        configureLabel(with: model.text)
        setupView()
    }
    
    private func setupView(){
        addSubview(leftIcon)
        addSubview(label)
    }
    
    private func configureIcon(with image: UIImage?) {
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        leftIcon.contentMode = .scaleAspectFit
        leftIcon.image = image
    }
    
    private func configureLabel(with text: String?) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = text
        label.font = TopBarFloatingPopUpAppereance.shared.font
        label.textColor = TopBarFloatingPopUpAppereance.shared.textColor
        label.numberOfLines = 0
    }
    
    override public func updateConstraints() {
        super.updateConstraints()
        if shouldUdpdateConstraints {
            addViewConstraints()
            shouldUdpdateConstraints = false
        }
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let superview = superview {
            addPositionAccording(superview)
        }
    }
    
    private func addPositionAccording(_ superview: UIView) {
        
        let width = widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.95)
        width.priority = UILayoutPriority(rawValue: 999)
        width.isActive = true
        
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0).isActive = true
        widthAnchor.constraint(lessThanOrEqualToConstant: 400).isActive = true
        
        bottomConstraint = bottomAnchor.constraint(equalTo: superview.topAnchor, constant: -10)
        bottomConstraint?.priority = UILayoutPriority(999)
        bottomConstraint?.isActive = true
        
        topConstraint = topAnchor.constraint(equalTo: superview.layoutMarginsGuide.topAnchor, constant: 5)
        topConstraint?.priority = UILayoutPriority(998)
        topConstraint?.isActive = true
    }
    
    //MARK: Display
    /**
        Shows the popup with an animation with damping
     */
    public func showPopUp() {
        superview?.layoutIfNeeded()
        delegate?.willAppear(self)
        bottomConstraint?.priority = UILayoutPriority(998)
        topConstraint?.priority = UILayoutPriority(999)
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.superview?.layoutIfNeeded()
        }){ [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.didAppear(strongSelf)
        }
    }
    
    /**
     Hides the popup with an animation with damping
     */
    public func hidePopUp() {
        delegate?.willDisappear(self)
        bottomConstraint?.priority = UILayoutPriority(999)
        topConstraint?.priority = UILayoutPriority(998)
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.superview?.layoutIfNeeded()
        }){ [weak self] result in
            self?.removeFromSuperview()
            guard let strongSelf = self else { return }
            strongSelf.delegate?.didDisappear(strongSelf)
        }
    }
    
    
    //MARK: Overrides
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }
    
    //MARK: Constraints setup
    
    private func addLeftIconConstraints() {
        leftIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13).isActive = true
        leftIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        leftIcon.widthAnchor.constraint(equalTo: leftIcon.heightAnchor, multiplier: 1.0).isActive = true
        leftIcon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
    
    private func addLabelConstraints() {
        label.leadingAnchor.constraint(equalTo: leftIcon.trailingAnchor, constant: 13).isActive = true
        label.centerYAnchor.constraint(equalTo: leftIcon.centerYAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 13).isActive = true
        label.bottomAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: -13).isActive = true
        // Right
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13).isActive = true
        let heightValue = (label.text?.size(withAttributes:
            [NSAttributedString.Key.font: TopBarFloatingPopUpAppereance.shared.font]) ?? .zero).height
        label.heightAnchor.constraint(equalToConstant: heightValue).isActive = true
    }
    
    private func addViewConstraints() {
        addLeftIconConstraints()
        addLabelConstraints()
    }
}
