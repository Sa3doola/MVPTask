//
//  HomeRouter.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import UIKit


protocol HomeRouter {
  func goTo(article: Article)
}

class HomeRouterImplementation: HomeRouter {
   
    fileprivate weak var HomeViewController: HomeViewController?
    
    init(HomeViewController: HomeViewController) {
        self.HomeViewController = HomeViewController
    }
    
    func goTo(article: Article) {
        let vc = ArticleViewController(article: article)
        vc.modalPresentationStyle = .fullScreen
        self.HomeViewController?.present(vc, animated: true, completion: nil)
    }
}
