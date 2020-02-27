//
//  ViewModelItems.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Tung Vu Duc on 2/26/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

protocol ProfileViewModelItem {
    var celllType: UITableViewCell.Type {get}
}

class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    var celllType: UITableViewCell.Type {
        return NamePictureCell.self
    }
    
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}


class ProfileViewModelAboutItem: ProfileViewModelItem {
    var celllType: UITableViewCell.Type {
        return AboutCell.self
    }
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class ProfileViewModelEmailItem: ProfileViewModelItem {
    var celllType: UITableViewCell.Type {
        return EmailCell.self
    }
        
    var email: String
    
    init(email: String) {
        self.email = email
    }
}

class ProfileViewModeAttributeItem: ProfileViewModelItem {
    var celllType: UITableViewCell.Type {
        return AttributeCell.self
    }
    
    var attribute: Attribute
    
    init(attribute: Attribute) {
        self.attribute = attribute
    }
}

class ProfileViewModeFriendsItem: ProfileViewModelItem {
    var celllType: UITableViewCell.Type {
        return FriendCell.self
    }
    
    var friend: Friend
    
    init(friend: Friend) {
        self.friend = friend
    }
}
