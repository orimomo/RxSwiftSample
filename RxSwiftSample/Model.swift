//
//  Model.swift
//  RxSwiftSample
//
//  Created by 折田桃子 on 2019/09/29.
//  Copyright © 2019 Momoko Orita. All rights reserved.
//

import Foundation
import Alamofire

class Model {
    
    func getItem(_ success: ((_ title: String, _ createdAt: String, _ url: String) -> Void)?, failure: (() -> Void)?) {
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
                                success(items[0].title, items[0].createdAt, items[0].url)
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
