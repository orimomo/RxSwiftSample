//
//  Model.swift
//  RxSwiftSample
//
//  Created by orimomo on 2019/09/29.
//  Copyright © 2019 orimomo. All rights reserved.
//

import Foundation
import Alamofire

class Model {
    
    func getItem(_ success: ((_ item: Item) -> Void)?, failure: (() -> Void)?) {
        let URL = "https://qiita.com/api/v2/items"
        let userName = "orimomo"
        
        Alamofire.request(
            URL,
            method: .get,
            parameters: [
                "page": 1,
                "per_page": 1,
                "query": "qiita user:\(userName)"
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
                            if let success = success {
                                guard let item = items.first else { return }
                                success(item)
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                case .failure(_): break
                    // error handling
                }
        }
    }
}
