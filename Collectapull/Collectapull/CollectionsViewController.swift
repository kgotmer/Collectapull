//
//  CollectionsViewController.swift
//  Collectapull
//
//  Created by Dolan,Allison L on 3/28/26.
//

import UIKit

class CollectionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var collections: [CollectionGroup] = []
    var filteredCollections: [CollectionGroup] = []
    var selectedCollection: CollectionGroup?
    
    let titleLabel = UILabel()
    let searchBar = UITextField()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        collections = sampleCollections
        filteredCollections = collections
        
        setupTitleLabel()
        setupSearchBar()
        setupTableView()
        
        tableView.reloadData()
    }
    
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Collectapull"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search your collections"
        searchBar.borderStyle = .roundedRect
        searchBar.delegate = self
        searchBar.addTarget(self, action: #selector(searchTextChanged(_:)), for: .editingChanged)
        
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CollectionCell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCollections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = filteredCollections[indexPath.row].name
        content.secondaryText = "\(filteredCollections[indexPath.row].items.count) items"
        cell.contentConfiguration = content
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCollection = filteredCollections[indexPath.row]
        
        let destination = ItemsInCollectionViewController()
        destination.selectedCollection = selectedCollection
        
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @objc func searchTextChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        if text.isEmpty {
            filteredCollections = collections
        } else {
            filteredCollections = collections.filter {
                $0.name.lowercased().contains(text.lowercased())
            }
        }
        
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
