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
//    var textRelay: BehaviorRelay<String> = BehaviorRelay(value: "？")
    
    let text = BehaviorRelay(value: "")
    
    private let disposeBag = DisposeBag()
    
    func getItem() {
        model.getItem()
        .subscribe(onNext: {[weak self] item in
            guard let weakSelf = self else { return }
            let text = weakSelf.createText(item: item)
            weakSelf.text.accept(text)
        }).disposed(by: disposeBag)
    }
    
    private func createText(item: Item) -> String {
        return "【新着記事】\n\nタイトル: \(item.title)\n\n投稿日時: \(item.createdAt)\n\nURL: \(item.url)"
    }
}
