//
//  PropertyListViewController.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import UIKit
import SwiftUI
import Combine

class PropertyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    internal var properties: [Property] = []
    private var cancellables = Set<AnyCancellable>()
    
    private var coreData = FavoritesManager.shared
    
    init(properties: [Property]) {
        
        self.properties = properties
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .plain)
        let nib = UINib(nibName: "PropertyCardViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "PropertyCardViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        return tableView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension PropertyListViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCardViewCell", for: indexPath) as! PropertyCardViewCell
        let property = properties[indexPath.section]
        
        cell.updateCardContent(with: property)
        
        cell.favoriteButton.tag = indexPath.section
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        
        headerView.backgroundColor = .clear
        return headerView
    }
        
    // MARK: Navigation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedProperty = properties[indexPath.section]
        
        let detailView = PropertyDetailView(property: selectedProperty)
        
        let hostingController = UIHostingController(rootView: detailView)
        
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    // MARK: Favorite
    
    @objc private func favoriteButtonTapped(_ sender: UIButton) {
        
        let index = sender.tag
        guard index < properties.count else { return }
        
        toggleFavorite(at: IndexPath(row: 0, section: index))
    }
    
    private func toggleFavorite(at indexPath: IndexPath) {
        
        let property = properties[indexPath.section]
        
        let favorite = coreData.toggleFavorite(property)
       
        properties[indexPath.section] = property
        
        if let cell = tableView.cellForRow(at: indexPath) as? PropertyCardViewCell {
            
            UIView.transition(with: cell.favoriteButton, duration: 0.3, options: .transitionCrossDissolve) {
                cell.updateFavoriteButton(isFavorite: favorite.isFavorite)
            }
        }
    }
}
