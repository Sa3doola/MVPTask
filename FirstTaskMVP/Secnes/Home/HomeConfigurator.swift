//
//  HomeConfigurator.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import Foundation


protocol HomeConfigurator {
    func configure(HomeViewController:HomeViewController)
}


class HomeConfiguratorImplementation {

    func configure(HomeViewController:HomeViewController) {
        let view = HomeViewController
        let router = HomeRouterImplementation(HomeViewController: view)
        
        let interactor = HomeInteractor()
        let presenter = HomePresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        HomeViewController.presenter = presenter
    }
    
}
