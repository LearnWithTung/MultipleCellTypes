//
//  AttributeCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension AttributeCell: TableViewBinder {

    func bind(model: ProfileViewModelItem) {
        guard let item = model as? ProfileViewModeAttributeItem else {
            return
        }
        titleLabel?.text = item.attribute.key
        valueLabel?.text = item.attribute.value
        
    }
    
}

