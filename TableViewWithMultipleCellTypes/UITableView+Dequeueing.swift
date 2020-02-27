//
//  UITableView+Dequeueing.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Tung Vu Duc on 2/24/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func getCell<T: UITableViewCell>(type: T.Type) -> T {
        let identifier = "\(type)"
        if let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T {
            return cell
        } else {
            return UINib.init(nibName: identifier, bundle: nil).instantiate(withOwner: self, options: nil).first as! T
        }
    }
    
}
