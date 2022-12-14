//
//  Discover.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

//presenter to view
protocol DiscoverViewInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
    func showActivityIndicator()
    func hideActivityIndicator()
    func hideRefreshIndicator()
}

class DiscoverViewController: BaseViewController {

    var presenter: DiscoverPresenterProtocol?
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var refreshController: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(userPulledView), for: .valueChanged)
        refreshControl.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        return refreshControl
    }()
    
    @objc private func userPulledView() {
        self.presenter?.viewDidLoad()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        presenter?.viewDidLoad()
    }
    
    override func setUpUI() {
        super.setUpUI()
        addSubViews()
        makeConstraints()
        
        // MARK: Uncomment the line below
        self.presenter?.collectionManager?.setUpCollectionView(collectionView: self.collectionView)
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(collectionView)
        collectionView.refreshControl = refreshController
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview().inset(15.0)
        }
    }

}


extension DiscoverViewController: DiscoverViewInput {
    func hideRefreshIndicator() {
        self.refreshController.endRefreshing()
    }
    
    
}
