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
    }
    
    let transition = PanelTransition()
    
    lazy var navigationBar: NavigationBar = {
        let navigationBar = NavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.delegate = self
        return navigationBar
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PromoCollectionViewCell.self, forCellWithReuseIdentifier: PromoCollectionViewCell.reuseIdentifier)
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseIdentifier)
        collectionView.register(DiscountCollectionViewCell.self, forCellWithReuseIdentifier: DiscountCollectionViewCell.reuseIdentifier)
        collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.reuseIdentifier)
        collectionView.register(BaseHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaseHeaderView.reuseIdentifier)
        collectionView.register(DiscountHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DiscountHeaderView.reuseIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureCollectionView()
        configureNavigationBar()
    }
    
    private func configureCollectionView() {
        view.addSubview(navigationBar)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 115)
        ])
    }
    
    private func configureNavigationBar() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }
            
            var itemSize: NSCollectionLayoutSize
            var groupSize: NSCollectionLayoutSize
            var item: NSCollectionLayoutItem
            var group: NSCollectionLayoutGroup
            var headerFooterSize: NSCollectionLayoutSize? = nil
            var scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none
            var sectionContentInsets: NSDirectionalEdgeInsets
            
            switch sectionLayoutKind {
            case .promo:
                itemSize = NSCollectionLayoutSize(widthDimension: .absolute(85), heightDimension: .absolute(88))
                groupSize = itemSize
                item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                scrollingBehavior = .continuous
                sectionContentInsets = NSDirectionalEdgeInsets(top: 20, leading: 12.5, bottom: 0, trailing: 12.5)

            case .banners:
                itemSize = NSCollectionLayoutSize(widthDimension: .absolute(300), heightDimension: .absolute(115))
                groupSize = itemSize
                item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                scrollingBehavior = .continuous
                sectionContentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 27.5, trailing: 10)
                
            case .sales:
                itemSize = NSCollectionLayoutSize(widthDimension: .absolute(112), heightDimension: .absolute(208))
                groupSize = itemSize
                item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(25))
                scrollingBehavior = .continuous
                sectionContentInsets = NSDirectionalEdgeInsets(top: 16, leading: 10, bottom: 27.5, trailing: 10)

            case .catalog:
                itemSize = NSCollectionLayoutSize(widthDimension: .absolute(108), heightDimension: .absolute(135))
                groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(145))
                item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
                group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(25))
                sectionContentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 10, trailing: 10)
            }
                        
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = scrollingBehavior
            section.contentInsets = sectionContentInsets
            
            if headerFooterSize != nil {
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize!,
                                                                                elementKind: UICollectionView.elementKindSectionHeader,
                                                                                alignment: .top)
                sectionHeader.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                section.boundarySupplementaryItems = [sectionHeader]
            }
            return section
        }
        return layout
    }
}
