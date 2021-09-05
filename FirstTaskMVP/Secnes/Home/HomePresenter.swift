//
//  HomePresenter.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import Foundation

protocol HomeView: AnyObject {
    func reloadData()
}

protocol HomeCellView {
    func cellConfigure(model: Article)
}

protocol HomePresenter {
    func viewDidLoad()
    func cellCount() -> Int
    func configure(cell: HomeCellView, forRow row: Int)
    func didSelectArticle(at row: Int)
}

class HomePresenterImplementation: HomePresenter {
    
    fileprivate weak var view: HomeView?
    internal let router: HomeRouter
    internal let interactor : HomeInteractor

    var aritcle: [Article]?
    
    init(view: HomeView,router: HomeRouter,interactor:HomeInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }
    
    func viewDidLoad() {
        getData()
    }
    
    func getData() {
        interactor.getData { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.aritcle = model.articles
                DispatchQueue.main.async {
                    self.view?.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func configure(cell: HomeCellView, forRow row: Int) {
        guard let data = aritcle?[row] else { return }
        cell.cellConfigure(model: data)
    }
    
    func cellCount() -> Int {
        return aritcle?.count ?? 0
    }
    
    func didSelectArticle(at row: Int) {
        guard let article = aritcle?[row] else { return }
        router.goTo(article: article)
    }
}
