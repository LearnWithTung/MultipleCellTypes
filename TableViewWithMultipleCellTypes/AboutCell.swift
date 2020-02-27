//
//  AboutCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel?
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension AboutCell: TableViewBinder {
    
    func bind(model: ProfileViewModelItem) {
        guard  let item = model as? ProfileViewModelAboutItem else {
            return
        }
        
        aboutLabel?.text = item.about
    }
    
}
