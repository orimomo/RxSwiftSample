//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by orimomo on 2019/09/28.
//  Copyright © 2019 orimomo. All rights reserved.
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
        
        self.viewModel.getItem()
        
        getButton.rx.tap
            .subscribe { [weak self] _ in
                guard let weakSelf = self else { return }
                weakSelf.label.text = weakSelf.viewModel.text.value
        }.disposed(by: disposeBag)
        
        clearButton.rx.tap
            .subscribe { [weak self] _ in
                guard let weakSelf = self else { return }
                weakSelf.label.text = ""
        }.disposed(by: disposeBag)
    }
}

