//
//  ViewController.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    enum SectionLayoutKind: Int, CaseIterable {
        case promo, banners, sales, catalog
        var columnCount: Int {
            switch self {
            case .promo:
                return 4
            case .banners:
                return 1
            case .sales:
                return 3
            case .catalog:
                return 3
            }
        }
        
//        var reuseIdentifier: String {
//            switch self {
//            case .promo:
//                return PromoCollectionViewCell.reuseIdentifier
//            case .banners:
//                return BannerCollectionViewCell.reuseIdentifier
//            case .sales:
//                return SalesCollectionViewCell.reuseIdentifier
//            case .catalog:
//                return CatalogCollectionViewCell.reuseIdentifier
//            }
//        }
        
    }
    
//    static let sectionHeaderElementKind = "section-header-element-kind"
//    static let sectionFooterElementKind = "section-footer-element-kind"
    
    private var collectionView: UICollectionView! = nil
    private var navigationBar: NavigationBar! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureHierarchy()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            guard let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }
            let columns = sectionLayoutKind.columnCount

            // MARK: Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
//            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(102),
//                                                 heightDimension: .absolute(208))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

            // MARK: Group
            var groupHeight: NSCollectionLayoutDimension
            var groupWidth: NSCollectionLayoutDimension
            
            switch sectionLayoutKind {
            case .promo:
                groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.3)
                groupWidth = NSCollectionLayoutDimension.fractionalWidth(0.95)
                
            case .banners:
                groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.3)
                groupWidth = NSCollectionLayoutDimension.fractionalWidth(0.8)
                
            case .sales:
                groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.6)
                groupWidth = NSCollectionLayoutDimension.fractionalWidth(0.9)
                
            case .catalog:
                groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.45)
                groupWidth = NSCollectionLayoutDimension.fractionalWidth(1.0)
            }
            
            let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)

            // MARK: Section
            let section = NSCollectionLayoutSection(group: group)
            
            switch sectionLayoutKind {
            case .sales, .catalog:
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .absolute(40))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
            default:
                break
            }
            
            switch sectionLayoutKind {
            case .banners, .promo, .sales:
                section.orthogonalScrollingBehavior = .continuous
            default:
                break
            }
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10)
            return section
        }
        return layout
    }
    
    private func configureHierarchy() {
        navigationBar = NavigationBar()
        navigationBar.delegate = self
        
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground

        view.addSubview(collectionView)
        view.addSubview(navigationBar)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 115),
            
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuseId")
        collectionView.register(PromoCollectionViewCell.self, forCellWithReuseIdentifier: PromoCollectionViewCell.reuseIdentifier)
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseIdentifier)
        collectionView.register(DiscountCollectionViewCell.self, forCellWithReuseIdentifier: DiscountCollectionViewCell.reuseIdentifier)
        collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.reuseIdentifier)
        collectionView.register(BaseHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaseHeaderView.reuseIdentifier)
        collectionView.register(DiscountHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DiscountHeaderView.reuseIdentifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "reuseIdentifier")
    }
}

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
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionKind!.reuseIdentifier, for: indexPath) as! Configurable
//        cell.configure(model: )
        
        switch sectionKind {
        case .promo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.reuseIdentifier, for: indexPath) as! PromoCollectionViewCell
//            cell.titleLabel.text = PromoItem.debug()[indexPath.row].name
//            cell.imageView.image = PromoItem.debug()[indexPath.row].image
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
//        if indexPath.section == 2 {
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DiscountHeaderView.reuseIdentifier, for: indexPath) as! DiscountHeaderView
//            return header
//        } else {
//            return UICollectionReusableView(frame: .zero)
//        }
        
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return 40
//    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: NavigationBarDelegate {
    func presentAddressSearchController() {
        let vc = SearchViewController { [weak self] (address) in
            self?.navigationBar.addressView.currentAddressLabel.text = address.data!.street! + " " + address.data!.house!
        }
        let presenter = SearchPresenter(view: vc)
        vc.presenter = presenter
        present(vc, animated: true)
    }
}

