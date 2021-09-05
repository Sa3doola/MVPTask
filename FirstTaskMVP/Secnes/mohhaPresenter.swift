//
//  mohhaPresenter.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/5/21.
//

import Foundation

protocol mohhaView: AnyObject {

}


protocol mohhaCellView {
    
}

protocol mohhaPresenter {
    func viewDidLoad()
    func configure(cell: mohhaCellView, forRow row: Int)
}

class mohhaPresenterImplementation: mohhaPresenter {
    fileprivate weak var view: mohhaView?
    internal let router: mohhaRouter
    internal let interactor : mohhaInteractor

    
    init(view: mohhaView,router: mohhaRouter,interactor:mohhaInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: mohhaCellView, forRow row: Int) {
       
    }

}
