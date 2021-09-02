//
//  ArticlePresenter.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import Foundation

protocol ArticleView: AnyObject {
    func configureText()
}


protocol ArticleCellView {
    
}

protocol ArticlePresenter {
    func viewDidLoad()
    func configure(cell: ArticleCellView, forRow row: Int)
}

class ArticlePresenterImplementation: ArticlePresenter {
    fileprivate weak var view: ArticleView?
    internal let router: ArticleRouter
    internal let interactor : ArticleInteractor

    
    init(view: ArticleView,router: ArticleRouter,interactor:ArticleInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: ArticleCellView, forRow row: Int) {
       
    }

}
