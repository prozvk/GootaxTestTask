//
//  MainViewController + DataSource.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionLayoutKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 3:
            return 9
        default:
            return 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionKind = SectionLayoutKind(rawValue: indexPath.section)
        
        switch sectionKind {
        case .promo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.reuseIdentifier, for: indexPath) as! PromoCollectionViewCell
            cell.configure(model: PromoItem.debug()[indexPath.row])
            return cell
            
        case.banners:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseIdentifier, for: indexPath) as! BannerCollectionViewCell
            cell.bannerImageView.image = UIImage(named: "banner") //PromoItem.debug()[indexPath.row].image
            return cell
            
        case .sales:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.reuseIdentifier, for: indexPath) as! DiscountCollectionViewCell
            cell.imageView.image = SaleItem.debug()[indexPath.row].image
            cell.titleLabel.text = SaleItem.debug()[indexPath.row].name
            cell.weightLabel.text = SaleItem.debug()[indexPath.row].weight
            return cell
            
        case .catalog:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.reuseIdentifier, for: indexPath) as! CatalogCollectionViewCell
            cell.titleLabel.text = CatalogItem.debug()[indexPath.row].name
            cell.imageView.image = CatalogItem.debug()[indexPath.row].image
            cell.backgroundColor = CatalogItem.debug()[indexPath.row].color
            return cell
        case .none:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "reuseId", for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 2 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DiscountHeaderView.reuseIdentifier, for: indexPath) as! DiscountHeaderView
            header.label.text = "Акции"
            return header
        }
        else if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 3 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaseHeaderView.reuseIdentifier, for: indexPath) as! BaseHeaderView
            header.label.text = "Каталог"
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reuseIdentifier", for: indexPath)
            return header
        }
    }
}
