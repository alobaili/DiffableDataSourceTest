//
//  ViewController.swift
//  DiffableDataSourceTest
//
//  Created by Abdulaziz AlObaili on 03/02/2020.
//  Copyright © 2020 Abdulaziz AlObaili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section { case main }

    @IBOutlet weak var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, Item>!
    var items = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        
        for number in 1...100 {
            items.append(Item(id: number, name: "\(number)"))
        }
        updateData(for: items)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        let indexPaths = tableView.indexPathsForSelectedRows!
        
        for indexPath in indexPaths {
            let item = dataSource.itemIdentifier(for: indexPath)!
            items.removeAll { $0.id == item.id }
        }
        
        updateData(for: items)
    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, Item>(tableView: tableView, cellProvider: { (tableView, indexPath, item) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ItemTableViewCell
            cell.checkBox.tag = item.id
            cell.nameLabel.text = item.name
            cell.viewController = self
            cell.item = item
            return cell
        })
    }
    
    func updateData(for items: [Item]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource.apply(snapshot)
    }
    

}

