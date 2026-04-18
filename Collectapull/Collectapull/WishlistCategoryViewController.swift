//
//  WishlistCategoryViewController.swift
//  
//
//  Created by Kallam,Poornima on 4/16/26.
//
import UIKit

class WishlistCategoryViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    var collectionName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = collectionName
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}
