//
//  ItemTableViewCell.swift
//  DiffableDataSourceTest
//
//  Created by Abdulaziz AlObaili on 03/02/2020.
//  Copyright © 2020 Abdulaziz AlObaili. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    var item: Item!
    weak var viewController: ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        checkBox.isSelected = selected
    }

    @IBAction func checkBoxTapped(_ sender: UIButton) {
        checkBox.isSelected.toggle()
        self.setSelected(checkBox.isSelected, animated: true)
        let indexPath = viewController.dataSource.indexPath(for: item)!
        if checkBox.isSelected {
            viewController.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            viewController.tableView.delegate?.tableView?(viewController.tableView, didSelectRowAt: indexPath)
        } else {
            viewController.tableView.deselectRow(at: indexPath, animated: true)
            viewController.tableView.delegate?.tableView?(viewController.tableView, didDeselectRowAt: indexPath)
        }
    }
}
