//
//  HomeInteractor.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import Foundation

class HomeInteractor {
    
    let manager = APIManager.shared
    
    func getData(complition: @escaping (Result<ArticlesModel,Error>) -> Void)  {
        let urlString = "\(Constants.baseAPIURL)&apiKey=\(Constants.api_Key)"
        manager.fetchGenericJSONData(urlString: urlString, completion: complition)
    }
}
