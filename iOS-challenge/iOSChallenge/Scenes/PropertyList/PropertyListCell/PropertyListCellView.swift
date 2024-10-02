//
//  PropertyListCellView.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import UIKit

class PropertyListCellView: UITableViewCell {
    
    private var containerView: UIView!
    
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var propertyTitle: UILabel!
    @IBOutlet weak var propertyOperationType: UILabel!
    @IBOutlet weak var propertyPrice: UILabel!
    @IBOutlet weak var propertySize: UILabel!
    @IBOutlet weak var propertyRooms: UILabel!
    @IBOutlet weak var propertyBathrooms: UILabel!
    
    var favoriteButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        setupContainerView()
        configureCellAppearance()
    }
    
    private func setupContainerView() {
        
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        for subview in contentView.subviews where subview != containerView {
            
            containerView.addSubview(subview)
        }
    }
    
    private func configureCellAppearance() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        
        containerView.layer.masksToBounds = false
        layer.masksToBounds = false
    }
    
    internal func updateUI(with property: Property) {
        
        if let thumbnailURL = URL(string: property.thumbnail) {
            
            propertyImageView.loadImage(from: thumbnailURL)
        }
        
        propertyTitle.text = property.address.capitalizedFirstLetter
        propertyOperationType.text = "\(property.propertyType.capitalizedFirstLetter) \(property.operation) - \(property.neighborhood), \(property.municipality)"
        propertyPrice.text = "\(property.priceInfo.price.amount.formattedDouble) \(property.priceInfo.price.currencySuffix)"
        propertySize.text = "\(property.size.formattedDouble) m²"
        propertyRooms.text = "\(property.rooms) hab."
        propertyBathrooms.text = "\(property.bathrooms) baños"
    }
}
