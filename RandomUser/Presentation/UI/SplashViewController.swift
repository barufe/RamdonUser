//
//  SplashViewController.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private var viewModel: UserListViewModel?
    let networkManager = NetworkManager.shared
    
    init(viewModel: UserListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        
        guard Reachability.isConnectedToNetwork() else{
            self.networkManager.isConnected = false
            getUser()
            return
        }
        self.networkManager.isConnected = true
        getUser()
    }
    
    private func navigateToListViewController() {
        let listViewController = ListViewController(viewModel: viewModel!)
        navigationController?.pushViewController(listViewController, animated: false)
    }
    
    private func getUser() {
        self.viewModel?.getUsers {result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.loading.stopAnimating()
                    self.navigateToListViewController()
                case .failure(let error):
                    print("Error fetching users: \(error)")
                    
                    let alert = UIAlertController(title: "Error", message: "You need to have an internet connection to connect.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Accept", style: .default) { _ in
                        
                        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            exit(EXIT_SUCCESS)
                        }
                    })
                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
            }
        }
    }
}
