//
//  ArticleRouter.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import UIKit


protocol ArticleRouter {
  
}

class ArticleRouterImplementation: ArticleRouter {
    fileprivate weak var ArticleViewController: ArticleViewController?
    
    init(ArticleViewController: ArticleViewController) {
        self.ArticleViewController = ArticleViewController
    }
    
    
}
