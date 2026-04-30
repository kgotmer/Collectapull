//
//  WishlistViewController.swift
//  
//
//  Created by Kallam,Poornima on 4/16/26.
//

import UIKit

class WishlistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var createListButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    var collections: [String] = ["Collection A", "Collection B", "Collection C", "Collection D"]
    var selectedCollectionName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
        cell.textLabel?.text = collections[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCollectionName = collections[indexPath.row]
        performSegue(withIdentifier: "showWishlistCategory", sender: self)
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

                    let trimmed = newName.trimmingCharacters(in: .whitespaces)

                    if !trimmed.isEmpty {
                        self.collections.append(trimmed)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
