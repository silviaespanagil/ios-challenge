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
    
    init(properties: [Property]) {
        
        self.properties = properties
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .plain)
        let nib = UINib(nibName: "PropertyListCellView", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "PropertyListCellView")
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 320
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyListCellView", for: indexPath) as! PropertyListCellView
        let property = properties[indexPath.row]
        cell.updateUI(with: property)
        return cell
    }
    
    // - MARK: Navigation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedProperty = properties[indexPath.row]
        
        let detailView = PropertyDetailView(property: selectedProperty)
        
        let hostingController = UIHostingController(rootView: detailView)
        
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
