//
//  ItemsInCollectionViewController.swift
//  Collectapull
//
//  Created by Ingraham,Wyatt D on 4/16/26.
//

import UIKit

class ItemsInCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedCollection: CollectionGroup?
    var selectedItem: CollectibleItem?
    
    let titleLabel = UILabel()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupTitleLabel()
        setupCollectionView()
    }
    
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = selectedCollection?.name ?? "Collection"
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ItemImageCell.self, forCellWithReuseIdentifier: "ItemImageCell")
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCollection?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemImageCell", for: indexPath) as! ItemImageCell
        
        if let item = selectedCollection?.items[indexPath.row] {
            cell.nameLabel.text = item.name
            cell.imageView.image = UIImage(named: item.imageName)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = selectedCollection?.items[indexPath.row]
        
        guard let item = selectedItem else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
        
        destination.nameText = item.name
        destination.yearText = item.yearMade
        destination.typeText = item.productType
        destination.priceText = item.pricePurchasedAt
        destination.currentText = item.currentValue
        destination.collectionText = selectedCollection?.name ?? ""
        destination.descriptionText = item.extraDescription
        destination.image = UIImage(named: item.imageName) ?? UIImage(named: "placeholder") ?? UIImage()
        
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 16) / 2
        return CGSize(width: width, height: 170)
    }
}
