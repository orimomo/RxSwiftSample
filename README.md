# RxSwiftSample

## 概要
* RxSwiftを使ったAPI通信処理をざっくり理解するために作ったサンプル
* ボタンを押すと[QiitaAPI](https://qiita.com/api/v2/docs) から自分の最新記事情報を取得し、表示する
* RxSwiftでのイベント処理と、APIから取得したデータのバインディング（Relay）を実装
* アーキテクチャはMVVMを使用

## デモ
![Oct-05-2019 19-28-02](https://user-images.githubusercontent.com/12453846/66253610-4b92a580-e7a6-11e9-9b4b-8a548eb666f5.gif)

## 環境
* macOS: Catalina 10.15 Beta
* Xcode version: 11.0
* Swift Language version: 5.0

## ライブラリ
### 管理ツール
CocoaPods

※事前に`pod install`してください

### 使用ライブラリ
* RxSwift
* RxCocoa
* Alamofire
