//
//  ViewController.swift
//  Messenger
//
//  Created by Decagon Macbook Pro on 08/10/2021.
//

import UIKit

class ConversationsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Chats"
        navigationController?.navigationBar.prefersLargeTitles = true
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}

