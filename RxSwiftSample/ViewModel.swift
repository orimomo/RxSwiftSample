//
//  ViewModel.swift
//  RxSwiftSample
//
//  Created by orimomo on 2019/09/28.
//  Copyright © 2019 orimomo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    private let model = Model()
    var textRelay: BehaviorRelay<String> = BehaviorRelay(value: "？")
    
    func getItem() {
        model.getItem({ [weak self] item in
            guard let self = self else { return }
            let text = "【新着記事】\n\nタイトル: \(item.title)\n\n投稿日時: \(item.createdAt)\n\nURL: \(item.url)"
            self.textRelay.accept(text)
            
            }, failure: {
                // error handling
        })
    }
    
    func clearText() {
        textRelay.accept("？")
    }
}
