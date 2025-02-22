//
//  MainViewModel.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import Foundation

final class MainViewModel: MainViewModelProtocol {
    private(set) var arrUsers: [User] = [] 
    var delegate: MainViewModelDelegate?
    var service: NetworkServiceProtocol
    
    init(delegate: (any MainViewModelDelegate)? = nil, service: NetworkServiceProtocol) {
        self.delegate = delegate
        self.service = service
    }
    
    func load() {
            service.fetchData(from: .users) { [weak self] (result: Result<[User], Error>) in
                guard let self = self else { return }
                switch result {
                case .success(let users):
                    self.arrUsers = users //MARK: Kullanıcı listesini güncelliyoruz
                    self.delegate?.handleOutput(.users(users)) //MARK: - Güncellenmiş veriyi VC'ye iletiyoruz
                case .failure(let error):
                    self.delegate?.handleOutput(.error(error))
                }
            }
        }
        

}
