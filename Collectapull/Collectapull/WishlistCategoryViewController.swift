//
//  WishlistCategoryViewController.swift
//  
//
//  Created by Kallam,Poornima on 4/16/26.
//
import UIKit

class WishlistCategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var collectionName: String = ""

    // Dummy data for items inside a wishlist
    var items: [String] = ["Item 1", "Item 2", "Item 3", "Item 4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = collectionName

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Collection View

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WishlistItemCell", for: indexPath)

        // simple default label (if using basic cell)
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = items[indexPath.row]
        }

        return cell
    }

    // When user taps an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: \(items[indexPath.row])")
    }

    // MARK: - Back Button

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}
