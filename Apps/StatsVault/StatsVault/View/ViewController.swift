//
//  ViewController.swift
//  
//  
//  Created by shsw228 on 2023/09/09
//


import UIKit
import SwiftUI

class ViewController: UIViewController {
    private var collectionView:UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureCollectionView()
    }


}

// MARK: タイトルなどを設定
extension ViewController {
    private func setupView() {
        setBackgroundColor()
        setTitleView()
        setSettingButton()
    }

    private func setTitleView() {
        // TODO: リソース切り出し
        // タイトル設定
        navigationItem.title = "ゲーム一覧"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic

    }
    private func setSettingButton() {
        // 右にアイコン表示
        // TODO: アプリ設定画面実装
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(tapSettingButton))
    }

    @objc
    private func tapSettingButton() {
        let vc = UIHostingController(rootView: AppSettingView())
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }

    private func setBackgroundColor() {
        self.view.backgroundColor = .systemBackground
    }


}

// MARK: CollectionView関連
extension ViewController {
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
}
