//
//  MainViewModelConstact.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import Foundation

protocol MainViewModelProtocol {
    //MARK: - ViewModel'de çağrılacak Delege
    var delegate: MainViewModelDelegate? { get set }
    func load()
}
enum MainViewmodelOutput {
    //MARK: - dönecek olan veriler
    case users([User])
    case error (Error)
}


protocol MainViewModelDelegate {
    func handleOutput(_ output: MainViewmodelOutput)
}
