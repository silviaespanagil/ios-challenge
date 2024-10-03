//
//  PropertyCardViewCell.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import UIKit

class PropertyCardViewCell: UITableViewCell {
    
    @IBOutlet weak var contentViewCell: UIView!
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var propertyTitle: UILabel!
    @IBOutlet weak var propertyOperationType: UILabel!
    @IBOutlet weak var propertyPrice: UILabel!
    @IBOutlet weak var propertySize: UILabel!
    @IBOutlet weak var propertyRooms: UILabel!
    @IBOutlet weak var propertyBathrooms: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        setupCellAppearance()
    }
    
    private func setupCellAppearance() {
        
        contentViewCell.clipsToBounds = false
        contentViewCell.layer.cornerRadius = 15
        contentViewCell.backgroundColor = UIColor.white
        
        contentViewCell.layer.borderWidth = 1
        contentViewCell.layer.borderColor = UIColor.lightGray.cgColor
        
        propertyImageView.clipsToBounds = true
        propertyImageView.layer.cornerRadius = 15
        propertyImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            propertyImageView.topAnchor.constraint(equalTo: contentViewCell.topAnchor),
            propertyImageView.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor),
            propertyImageView.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor)
        ])
        
        selectionStyle = .none
    }
    
    internal func updateCardContent(with property: Property) {
        
        if let thumbnailURL = URL(string: property.thumbnail) {
            propertyImageView.loadImage(from: thumbnailURL)
        }
        
        propertyTitle.text = property.address.capitalizedFirstLetter
        propertyOperationType.text = "\(property.propertyType.capitalizedFirstLetter) \(property.operation) - \(property.neighborhood), \(property.municipality)"
        propertyPrice.text = "\(property.priceInfo.price.amount.formattedDouble) \(property.priceInfo.price.currencySuffix)"
        propertySize.text = "\(property.size.formattedDouble) m²"
        propertyRooms.text = "\(property.rooms) hab."
        propertyBathrooms.text = "\(property.bathrooms) baños"
        
        updateFavoriteButton(isFavorite: property.isFavorite)
    }
    
    internal func updateFavoriteButton(isFavorite: Bool) {
        
        let imageName = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
