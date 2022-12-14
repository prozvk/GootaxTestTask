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
        let sectionKind = SectionLayoutKind(rawValue: section)
        
        switch sectionKind {
        case .promo:
            return PromoItem.debug().count
        case .banners:
            return PromoItem.debug().count
        case .sales:
            return SaleItem.debug().count
        case .catalog:
            return CatalogItem.debug().count
        case .none:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionKind = SectionLayoutKind(rawValue: indexPath.section)
        
        switch sectionKind {
        case .promo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.reuseIdentifier, for: indexPath) as! PromoCollectionViewCell
            let model = PromoItem.debug()[indexPath.row]
            cell.titleLabel.text = model.name
            cell.imageView.image = model.image
            return cell
            
        case.banners:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseIdentifier, for: indexPath) as! BannerCollectionViewCell
            cell.bannerImageView.image = UIImage(named: "banner")
            return cell
            
        case .sales:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.reuseIdentifier, for: indexPath) as! DiscountCollectionViewCell
            let model = SaleItem.debug()[indexPath.row]
            cell.imageView.image = model.image
            cell.titleLabel.text = model.name
            cell.weightLabel.text = model.weight
            return cell
            
        case .catalog:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.reuseIdentifier, for: indexPath) as! CatalogCollectionViewCell
            let model = CatalogItem.debug()[indexPath.row]
            cell.titleLabel.text = model.name
            cell.imageView.image = model.image
            cell.backgroundColor = model.color
            return cell
        case .none:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 2 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DiscountHeaderView.reuseIdentifier, for: indexPath) as! DiscountHeaderView
            header.title = "??????????"
            return header
        }
        else if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 3 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaseHeaderView.reuseIdentifier, for: indexPath) as! BaseHeaderView
            header.title = "??????????????"
            return header
        } else {
            return UICollectionReusableView()
        }
    }
}
