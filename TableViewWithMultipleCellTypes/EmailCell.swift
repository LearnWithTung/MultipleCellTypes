//
//  EmailCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel?
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension EmailCell: TableViewBinder {
    
    
    func bind(model: ProfileViewModelItem) {
        guard let item = model as? ProfileViewModelEmailItem else {
            return
        }
        
        emailLabel?.text = item.email
    }
    
    
}
