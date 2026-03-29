//
//  MainTabController.swift
//  placeholder
//
//  Created by Dolan,Allison L on 3/28/26.
//
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAppearance()
        
    }

    func setupTabs() {
        let home = makeNav(root: ViewController(), title: "Home", image: "house.fill")
        let wishlist = makeNav(root: WishlistViewController(), title: "Wishlist - ", image: "heart")
        let add = makeNav(root: AddViewController(), title: "Add - Allison", image: "plus.circle.fill")
        let collections = makeNav(root: CollectionsViewController(), title: "Collections - ", image: "square.grid.2x2")
        let account = makeNav(root: AccountViewController(), title: "Account - ", image: "person")

        viewControllers = [home, wishlist, add, collections, account]
    }

    func makeNav(root: UIViewController, title: String, image: String) -> UINavigationController {
        root.title = title
        root.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: image),
            selectedImage: UIImage(systemName: image)
        )
        return UINavigationController(rootViewController: root)
    }

    func setupAppearance() {
        let purple = UIColor(red: 108/255, green: 71/255, blue: 201/255, alpha: 1.0)

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.purple

        // Active and inactive tint
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.55)
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.barTintColor = purple
        tabBar.backgroundColor = purple
        tabBar.isTranslucent = false
    }
}
