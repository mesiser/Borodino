//
//  PublicationViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 06.05.2022.
//

import UIKit

class PublicationViewController: UIViewController {
    
    let tableView = UITableView.init(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func settingsNavigationBar() {
        navigationItem.title = K.NavControllerTitle.gallery_title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    private func createTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupConstraintsForTableView()
        
        tableView.register(PublicationCell.self, forCellReuseIdentifier: K.publication_ID_cell)
        tableView.frame = view.bounds
    }
    
    private func setupConstraintsForTableView() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PublicationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.publication_ID_cell, for: indexPath) as! PublicationCell
        
        
        return cell
    }
    
    
    
}
