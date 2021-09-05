//
//  mohhaConfigurator.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/5/21.
//

import Foundation


protocol mohhaConfigurator {
    func configure(mohhaViewController:mohhaViewController)
}


class mohhaConfiguratorImplementation {

    func configure(mohhaViewController:mohhaViewController) {
        let view = mohhaViewController
        let router = mohhaRouterImplementation(mohhaViewController: view)
        
        let interactor = mohhaInteractor()
        let presenter = mohhaPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        mohhaViewController.presenter = presenter
    }
    
}
