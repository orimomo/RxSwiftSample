//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 折田桃子 on 2019/09/28.
//  Copyright © 2019 Momoko Orita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.textRelay
            .asObservable()
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                self.label.text = text
            }).disposed(by: disposeBag)
        
        getButton.rx.tap
            .subscribe { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.getItem()
        }.disposed(by: disposeBag)
        
        clearButton.rx.tap
            .subscribe { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.clearText()
        }.disposed(by: disposeBag)
    }
}

