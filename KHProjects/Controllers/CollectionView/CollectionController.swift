//
//  CollectionController.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 20/04/24.
//

import UIKit

class CollectionController: UIViewController {
    /// IBOutlets
    @IBOutlet weak var collectionview: UICollectionView!
    
    private lazy var datasource = makeDatasource()
    private var viewmodel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // screen title
        title = "CollectionView"
        viewmodel = ViewModel()
        // setup tableview
        collectionview.registerCell(with: "CollectionViewCell")
        collectionview.dataSource = datasource
        collectionview.delegate = self
        applySnapshot()
    }
    
    // Datasource to display data
    func makeDatasource() -> UICollectionViewDiffableDataSource<MySection, String> {
        return UICollectionViewDiffableDataSource<MySection, String>(collectionView: collectionview) { collectionView, indexPath, itemIdentifier in
            // table cell identifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            // set string to cell label
            cell.setlabel = itemIdentifier
            return cell
        }
    }

    // bind data to collectionview datasource
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<MySection, String>()
        snapshot.appendSections([.items])
        snapshot.appendItems(viewmodel?.fetchList() ?? [], toSection: .items)
        datasource.apply(snapshot)
    }
}

extension CollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = view.window?.windowScene?.screen.bounds
        return CGSize(
            width: (screen?.width ?? 0) * 0.48,
            height: (screen?.height ?? 0) * 0.2
        )
    }
}
