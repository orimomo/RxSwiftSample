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
        
        Alamofire.request(
            URL,
            method: .get,
            parameters: [
                "page": 1,
                "per_page": 1,
                "query": "qiita user:orimomo"
            ])
            .responseJSON { (response) in

                switch response.result {
                case .success(_):
                    if let items = response.result.value as? [Any] {
                        for item in items {
                            if let JSON = item as? [String: Any] {
                                let title = JSON["title"] as! String
                                let createdAt = JSON["created_at"] as! String
                                let url = JSON["url"] as! String
                                
                                if let success = success {
                                    success(title, createdAt, url)
                                }
                            }
                        }
                    }
                case .failure(_): break
                    // error handling
                }
        }
    }
}
