//
//  HomeViewController.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var configurator = HomeConfiguratorImplementation()
    var presenter: HomePresenter?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        return table
    }()
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(HomeViewController: self)
        presenter?.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.fillSuperview()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.register(HomeTableViewCell.self,
                           forCellReuseIdentifier: HomeTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDelegate and DataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cellCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell else { fatalError("Could not load \(HomeTableViewCell.self)")
        }
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectArticle(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension HomeViewController: HomeView {
    
    func reloadData() {
        self.tableView.reloadData()
    }
}
