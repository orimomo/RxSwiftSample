//
//  Model.swift
//  RxSwiftSample
//
//  Created by orimomo on 2019/09/29.
//  Copyright © 2019 orimomo. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class Model {
    
    enum ConnectInfo {
        static let URL = "https://qiita.com/api/v2/items"
        static let UserName = "orimomo"
    }
    
    func getItem() -> Observable<Item> {
        let observable = Observable<Item>.create { observer in
            Alamofire.request(
                ConnectInfo.URL,
                method: .get,
                parameters: [
                    "page": 1,
                    "per_page": 1,
                    "query": "qiita user:\(ConnectInfo.UserName)"
                ])
                .responseJSON { (response) in

                    switch response.result {
                    case .success(_):
                        if let data = response.data {
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                // ルートが配列のJSONなので、配列としてデコードする
                                let items: [Item] = try decoder.decode([Item].self, from: data)
                                guard let item = items.first else { return }
                                observer.onNext(item)
                                observer.onCompleted()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
            }
             return Disposables.create(with: {})
        }
        return observable.take(1)
    }
}
