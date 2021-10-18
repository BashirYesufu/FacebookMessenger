//
//  ProfileViewController.swift
//  Messenger
//
//  Created by Decagon Macbook Pro on 08/10/2021.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

class ProfileViewController: UIViewController {

    let data = ["Log Out"]
    let identifier = "Cell"
    
    lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        profileTableView.dataSource = self
        profileTableView.delegate = self
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(profileTableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "Log Out Alert", message: "Do you want to log out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in
            guard let strongSelf = self else { return }
            
            // Logout Facebook session
            FBSDKLoginKit.LoginManager().logOut()
            do {
                try FirebaseAuth.Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "Logged In")
                let viewController = LoginViewController()
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.modalPresentationStyle = .fullScreen
                strongSelf.present(navigationController, animated: true, completion: nil)
            }
            catch {
                return
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true)
        
    }
    
}
