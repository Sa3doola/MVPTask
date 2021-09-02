//
//  ArticleConfigurator.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import Foundation


protocol ArticleConfigurator {
    func configure(ArticleViewController:ArticleViewController)
}


class ArticleConfiguratorImplementation {

    func configure(ArticleViewController:ArticleViewController) {
        let view = ArticleViewController
        let router = ArticleRouterImplementation(ArticleViewController: view)
        
        let interactor = ArticleInteractor()
        let presenter = ArticlePresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        ArticleViewController.presenter = presenter
    }
    
}
