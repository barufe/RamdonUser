//
//  UserTableViewCell.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with user: UserEntity) {
        nameLabel.text = "\(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
    }
}
