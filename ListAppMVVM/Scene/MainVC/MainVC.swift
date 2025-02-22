//
//  ViewController.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import UIKit
class MainVC: UIViewController {
    
    var viewModel: MainViewModel?
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User List"
        view.backgroundColor = .systemBackground
        setupUI()
        viewModel?.delegate = self
        viewModel?.load()
    }

    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
//MARK: - T UI Değişimi
extension MainVC: MainViewModelDelegate {
    func handleOutput(_ output: MainViewmodelOutput) {
        switch output {
        case .users:
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .error(let error):
            print(error)
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.arrUsers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        if let user = viewModel?.arrUsers[indexPath.row] {
            cell.nameLabel.text = user.name
            cell.eMailLabel.text = user.email
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        if let user = viewModel?.arrUsers[indexPath.row] {
            vc.user = user
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
