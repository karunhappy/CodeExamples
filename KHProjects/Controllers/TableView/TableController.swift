//
//  TableController.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 20/04/24.
//

import UIKit

class TableController: UIViewController {
    /// IBOutlets
    @IBOutlet weak var tableview: UITableView!
    
    /// Properties
    private lazy var datasource = makeDatasource()
    private var tableList = [String]()
    
    /// Intialise Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // screen title
        title = "TableView"
        // load list from plist
        tableList = Common.loadFromPlist(from: .table)
        // setup tableview
        tableview.registerCell(with: "MainTableCell")
        tableview.dataSource = datasource
        // allow table cell to auto adjust height as per data
        tableview.estimatedRowHeight = UITableView.automaticDimension
        applySnapshot()
    }

    // Datasource to display data
    func makeDatasource() -> UITableViewDiffableDataSource<MySection, String> {
        return UITableViewDiffableDataSource<MySection, String>(tableView: tableview) { tableView,indexPath,itemIdentifier in
            // table cell identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell", for: indexPath) as! MainTableCell
            // set string to cell label
            cell.textLabel?.text = itemIdentifier
            // set label to required numner of lines
            cell.textLabel?.numberOfLines = 0
            return cell
        }
    }

    // bind data to tableview datasource
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<MySection, String>()
        snapshot.appendSections([.items])
        snapshot.appendItems(tableList, toSection: .items)
        datasource.apply(snapshot)
    }
}
