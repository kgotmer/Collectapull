//
//  CollectionModels.swift
//  Collectapull
//
//  Created by Ingraham,Wyatt D on 4/16/26.
//

import Foundation
import UIKit

struct CollectibleItem {
    var name: String
    var yearMade: String
    var productType: String
    var pricePurchasedAt: String
    var currentValue: String
    var extraDescription: String
    var imageName: String
}

struct CollectionGroup {
    var name: String
    var items: [CollectibleItem]
}

let sampleCollections: [CollectionGroup] = [
    CollectionGroup(
        name: "Pokemon Cards",
        items: [
            CollectibleItem(
                name: "Charizard",
                yearMade: "2005",
                productType: "Card",
                pricePurchasedAt: "40",
                currentValue: "150",
                extraDescription: "Rare card in good condition.",
                imageName: "charizard"
            ),
            CollectibleItem(
                name: "Pikachu",
                yearMade: "2010",
                productType: "Card",
                pricePurchasedAt: "15",
                currentValue: "35",
                extraDescription: "Classic collectible card.",
                imageName: "pikachu"
            )
        ]
    ),
    CollectionGroup(
        name: "Marvel Figures",
        items: [
            CollectibleItem(
                name: "Iron Man",
                yearMade: "2022",
                productType: "Figure",
                pricePurchasedAt: "25",
                currentValue: "40",
                extraDescription: "Box has slight wear.",
                imageName: "ironman"
            ),
            CollectibleItem(
                name: "Spider-Man",
                yearMade: "2021",
                productType: "Figure",
                pricePurchasedAt: "20",
                currentValue: "45",
                extraDescription: "Displayed on shelf.",
                imageName: "spiderman"
            )
        ]
    ),
    CollectionGroup(
        name: "Funko Pops",
        items: [
            CollectibleItem(
                name: "Batman Funko",
                yearMade: "2020",
                productType: "Funko Pop",
                pricePurchasedAt: "12",
                currentValue: "28",
                extraDescription: "Limited edition.",
                imageName: "batmanfunko"
            )
        ]
    )
]
