//
//  ViewController.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 20/04/24.
//

import UIKit
enum MySection: Int {
    case items
}

class ViewController: UIViewController {
    
    /// IBOutlets
    @IBOutlet weak var tableview: UITableView!
    
    /// Properties
    private lazy var datasource = makeDatasource()
    private var mainList = [String]()
    
    /// Intialise Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // screen title
        title = "Main Screen"
        // load list from plist
        mainList = Common.loadFromPlist(from: .main)
        // setup tableview
        tableview.registerCell(with: "MainTableCell")
        tableview.dataSource = datasource
        tableview.delegate = self
        applySnapshot()
    }

    // Datasource to display data
    func makeDatasource() -> UITableViewDiffableDataSource<MySection, String> {
        return UITableViewDiffableDataSource<MySection, String>(tableView: tableview) { tableView,indexPath,itemIdentifier in
            // table cell identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell", for: indexPath) as! MainTableCell
            // set string to cell label
            cell.textLabel?.text = itemIdentifier
            cell.accessoryType = .none
            return cell
        }
    }

    // bind data to tableview datasource
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<MySection, String>()
        snapshot.appendSections([.items])
        snapshot.appendItems(mainList, toSection: .items)
        datasource.apply(snapshot)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to selected cell
        switch mainList[indexPath.row] {
        case "TableView":
            let controller = self.storyboard?.instantiateViewController(withIdentifier: TableController.toString) as! TableController
            show(controller, sender: nil)
        default:
            break
        }
    }
}
