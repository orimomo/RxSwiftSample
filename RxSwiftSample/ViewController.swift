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
    
    @IBOutlet weak var button: UIButton!
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button.rx.tap
            .subscribe { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.getItem()
            }
            .disposed(by: disposeBag)
    }
}

