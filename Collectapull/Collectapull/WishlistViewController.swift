//
//  WishlistViewController.swift
//  
//
//  Created by Kallam,Poornima on 4/16/26.
//

import UIKit

class WishlistViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var createListButton: UIButton!

    @IBOutlet weak var collectionAButton: UIButton!
    @IBOutlet weak var collectionBButton: UIButton!
    @IBOutlet weak var collectionCButton: UIButton!
    @IBOutlet weak var collectionDButton: UIButton!

    var collections: [String] = ["Collection A", "Collection B", "Collection C", "Collection D"]
    var selectedCollectionName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCollectionButtons()
    }

    func updateCollectionButtons() {
        collectionAButton.setTitle(collections[0], for: .normal)
        collectionBButton.setTitle(collections[1], for: .normal)
        collectionCButton.setTitle(collections[2], for: .normal)
        collectionDButton.setTitle(collections[3], for: .normal)
    }

    @IBAction func collectionButtonTapped(_ sender: UIButton) {
        selectedCollectionName = sender.currentTitle ?? "Collection"
        performSegue(withIdentifier: "showWishlistCategory", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWishlistCategory" {
            if let destination = segue.destination as? WishlistCategoryViewController {
                destination.collectionName = selectedCollectionName
            }
        }

        if segue.identifier == "showCreateWishlist" {
            if let destination = segue.destination as? CreateWishlistViewController {
                destination.modalPresentationStyle = .overFullScreen

                destination.onCreate = { [weak self] newName in
                    guard let self = self else { return }

                    if !newName.trimmingCharacters(in: .whitespaces).isEmpty {
                        for i in 0..<self.collections.count {
                            if self.collections[i].hasPrefix("Collection") {
                                self.collections[i] = newName
                                break
                            }
                        }
                        self.updateCollectionButtons()
                    }
                }
            }
        }
    }
}
