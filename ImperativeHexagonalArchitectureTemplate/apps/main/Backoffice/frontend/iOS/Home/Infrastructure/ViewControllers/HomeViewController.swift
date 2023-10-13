//
//  ViewController.swift
//  HexagonalArchitectureTemplate
//
//  Created by Javier Hernandez Sansalvador on 26/9/23.
//

import UIKit
import SwiftUI
import BackOffice

enum InitialOptions: String {
    case users
}

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    private let options: [InitialOptions] = [
        .users
    ]
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupAutoLayout()
    }
}

// MARK: - Setup view

private extension ViewController {
    func setupViews() {
        setupBackgroundColor()
        setupTableView()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = UIColor.white
    }
    
    func setupTableView() {
        view.addSubview(tableView)
    }
}

// MARK: - AutoLayout

private extension ViewController {
    func setupAutoLayout() {
        setupTableViewConstraints()
    }
    
    func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor
        ).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor
        ).isActive = true
        tableView.topAnchor.constraint(
            equalTo: view.topAnchor
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor
        ).isActive = true
    }
}

// MARK: - Table View Data Source

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell with a reuse identifier (e.g., "CellIdentifier").
        let cell = UITableViewCell()
        
        // Configure the cell with the data for the current row.
        cell.textLabel?.text = "Manage \(options[indexPath.row].rawValue)"
        cell.accessibilityLabel = "Manage \(options[indexPath.row].rawValue)"

        return cell
    }
}

