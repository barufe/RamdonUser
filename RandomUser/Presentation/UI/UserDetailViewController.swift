//
//  UserDetailViewController.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import UIKit

class UserDetailViewController: UIViewController {
    private let user: UserEntity
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    @IBOutlet weak var genderUser: UILabel!
    @IBOutlet weak var countryUser: UILabel!
    @IBOutlet weak var phoneUser: UILabel!
    @IBOutlet weak var cellUser: UILabel!
    
    init(user: UserEntity) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        //implementar la libreria para cargar las imagenes
        nameUser.text = "\(user.name.first + " " + user.name.last)"
        emailUser.text = user.email
        genderUser.text = user.gender
        countryUser.text = user.location.country
        phoneUser.text = user.phone
        cellUser.text = user.cell
    }
}
