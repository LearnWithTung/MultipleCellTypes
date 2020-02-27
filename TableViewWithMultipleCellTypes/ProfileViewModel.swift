//
//  ProfileViewModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 4/25/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation
import UIKit

class RowViewModel {
    let sectionTitle: String
    let items: [ProfileViewModelItem]
    
    init(sectionTitle: String, items: [ProfileViewModelItem]) {
        self.items = items
        self.sectionTitle = sectionTitle
    }
}

class ProfileViewModel: NSObject {
    typealias Observer<T> = (T) -> Void
    var sections = [RowViewModel]()
    private var loader: ProfileLoaderProtocol?
    var onLoadStateChange: Observer<Bool>?
    init(loader: ProfileLoaderProtocol) {
        self.loader = loader
        super.init()
    }
    
    func loadProfile() {
        loader?.loadUserData {[weak self] (result) in
            switch result {
            case .success(let profile):
                self?.parse(profile)
            case .failure:
                break
            }
        }
    }
    
    private func parse(_ profile: Profile) {
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
            sections.append(RowViewModel(sectionTitle: "Main Info", items: [nameAndPictureItem]))
        }
        
        if let about = profile.about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            sections.append(RowViewModel(sectionTitle: "About", items: [aboutItem]))
        }
        
        if let email = profile.email {
            let emailItem = ProfileViewModelEmailItem(email: email)
            sections.append(RowViewModel(sectionTitle: "Email", items: [emailItem]))
        }
        
        let attributes = profile.profileAttributes
        var attributeItems = [ProfileViewModelItem]()
        attributes.forEach({ (attribute) in
            let attributesItem = ProfileViewModeAttributeItem(attribute: attribute)
            attributeItems.append(attributesItem)
        })
        sections.append(RowViewModel(sectionTitle: "Attributes", items: attributeItems))
        
        let friends = profile.friends
        var friendItems = [ProfileViewModelItem]()
        friends.forEach({ (friend) in
            let friendsItem = ProfileViewModeFriendsItem(friend: friend)
            friendItems.append(friendsItem)
        })
        sections.append(RowViewModel(sectionTitle: "Friends", items: friendItems))
        onLoadStateChange?(true)
    }
}

extension ProfileViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].items[indexPath.row]
        let cellType = model.celllType
        let cell = tableView.getCell(type: cellType.self)
        (cell as? TableViewBinder)?.bind(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionTitle
    }
}



