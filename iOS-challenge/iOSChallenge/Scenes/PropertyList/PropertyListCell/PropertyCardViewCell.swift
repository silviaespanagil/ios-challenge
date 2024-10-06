//
//  PropertyCardViewCell.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import UIKit

class PropertyCardViewCell: UITableViewCell {
    
    let localization: PropertyCardLocalization = PropertyCardLocalization()
    
    private var favoritesManager = FavoritesManager.shared
    
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
        contentViewCell.backgroundColor = .clear
        
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
        
        let size = property.size.formattedDouble
        
        if let thumbnailURL = URL(string: property.thumbnail) {
            propertyImageView.loadImage(from: thumbnailURL)
        }
        
        propertyTitle.text = property.address.capitalizedFirstLetter
        propertyOperationType.text = localization.propertyTypeOperationAndLocation(property.propertyType,
                                                                                   operation: property.operation,
                                                                                   neighborhood: property.neighborhood,
                                                                                   municipality: property.municipality)
        propertyPrice.text = localization.formattedPrice(property.priceInfo.price.amount.formattedDouble,
                                                         currency: property.priceInfo.price.currencySuffix)
        propertySize.text = localization.formattedSize(size)
        propertyRooms.text = localization.formattedRooms(property.rooms)
        propertyBathrooms.text = localization.formattedBathrooms(property.bathrooms)
        
        let favorite = favoritesManager.getFavorite(property)
        updateFavoriteButton(isFavorite: favorite.isFavorite)
    }
    
    internal func updateFavoriteButton(isFavorite: Bool) {
        
        let imageName = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
