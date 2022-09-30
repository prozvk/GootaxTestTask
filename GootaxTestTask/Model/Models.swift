//
//  Models.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import Foundation
import UIKit

struct PromoItem {
    var name: String
    var image: UIImage
    
    static func debug() -> [PromoItem] {
        return [
            PromoItem(name: "Летний пикник", image: UIImage(named: "pizza")!),
            PromoItem(name: "Летний обед", image: UIImage(named: "salad")!),
            PromoItem(name: "На завтрак", image: UIImage(named: "pancake")!),
            PromoItem(name: "На Ужин", image: UIImage(named: "sandwich")!),
            PromoItem(name: "Летний обед", image: UIImage(named: "salad")!),
            PromoItem(name: "Летний пикник", image: UIImage(named: "pizza")!),
            PromoItem(name: "На Ужин", image: UIImage(named: "sandwich")!),
        ]
    }
}

struct SaleItem {
    var name: String
    var image: UIImage
    var weight: String
    var oldPrice: String
    var newPrice: String
    
    static func debug() -> [SaleItem] {
        return [
            SaleItem(name: "Равиолли с грибами", image: UIImage(named: "item")!, weight: "230 г", oldPrice: "360", newPrice: "200"),
            SaleItem(name: "Казаречче с индейкой и томатами", image: UIImage(named: "item")!, weight: "230 г", oldPrice: "360", newPrice: "200"),
            SaleItem(name: "Черный спагетти с морепродуктами", image: UIImage(named: "item")!, weight: "230 г", oldPrice: "360", newPrice: "200"),
            SaleItem(name: "Равиолли с грибами", image: UIImage(named: "item")!, weight: "230 г", oldPrice: "360", newPrice: "200"),
            SaleItem(name: "Казаречче с индейкой и томатами", image: UIImage(named: "item")!, weight: "230 г", oldPrice: "360", newPrice: "200"),
            SaleItem(name: "Черный спагетти с морепродуктами", image: UIImage(named: "item")!, weight: "230 г", oldPrice: "360", newPrice: "200"),
            SaleItem(name: "Равиолли с грибами", image: UIImage(named: "item")!, weight: "230 г", oldPrice: "360", newPrice: "200"),
        ]
    }
}

struct CatalogItem {
    var name: String
    var image: UIImage
    var color: UIColor
    
    static func debug() -> [CatalogItem] {
        return [
            CatalogItem(name: "Наборы", image: UIImage(named: "sets")!, color: UIColor(red: 1, green: 0.757, blue: 0.714, alpha: 1)),
            CatalogItem(name: "Пицца", image: UIImage(named: "pizzas")!, color: UIColor(red: 1, green: 0.882, blue: 0.678, alpha: 1)),
            CatalogItem(name: "Паста", image: UIImage(named: "pasta")!, color: UIColor(red: 0.729, green: 0.722, blue: 0.573, alpha: 1)),
            CatalogItem(name: "Ризотто", image: UIImage(named: "risotto")!, color: UIColor(red: 0.769, green: 0.827, blue: 0.808, alpha: 1)),
            CatalogItem(name: "Салаты", image: UIImage(named: "salads")!, color: UIColor(red: 0.725, green: 0.769, blue: 0.784, alpha: 1)),
            CatalogItem(name: "Полуфабрикаты", image: UIImage(named: "polu")!, color: UIColor(red: 0.639, green: 0.682, blue: 0.616, alpha: 1)),
            CatalogItem(name: "Десерты", image: UIImage(named: "desert")!, color: UIColor(red: 1, green: 0.903, blue: 0.714, alpha: 1)),
            CatalogItem(name: "Добавки", image: UIImage(named: "adds")!, color: UIColor(red: 0.827, green: 0.769, blue: 0.769, alpha: 1)),
            CatalogItem(name: "Напитки", image: UIImage(named: "drinks")!, color: UIColor(red: 1, green: 0.833, blue: 0.678, alpha: 1))
        ]
    }
}
