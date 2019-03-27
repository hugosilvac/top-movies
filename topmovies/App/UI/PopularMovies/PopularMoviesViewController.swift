//
//  PopularMoviesViewController.swift
//  topmovies
//
//  Created by HugoSilva on 3/23/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PopularMoviesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var refreshBottom: UIRefreshControl?
    private let disposeBag = DisposeBag()
    private let popularMoviesViewModel = PopularMoviesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func configCollection() {
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 60, right: 0)
        
        // Reuse Identifier
        collectionView.register(UINib(nibName: Constants.Cell.ReuseIdentifierMovieCollectionCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cell.ReuseIdentifierMovieCollectionCell)
        
        bindViewModel()
    }

    private func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let pull = collectionView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        let input = PopularMoviesViewModel.Input(trigger: Driver.merge(viewWillAppear, pull),
                                           selection: collectionView.rx.itemSelected.asDriver(),
                                           loadNextPageTrigger: collectionView.rx.reachedBottom.asDriver())
        
        let output = popularMoviesViewModel.transform(input: input, page: Constants.RequestMovieParameters.Page, language: Constants.RequestMovieParameters.Language)
        
        output.fetchingTop
            .drive(collectionView.refreshControl!.rx.isRefreshing)
            .disposed(by: disposeBag)
        
        output.post.asObservable()
            .bind(to: collectionView.rx.items(cellIdentifier: Constants.Cell.ReuseIdentifierMovieCollectionCell, cellType: MovieCollectionViewCell.self))
            { tv, movie, cell in
                //ManagerImage
                cell.albumDefaultCell(strImage: ManagerImage.linkImage(finalUrl: movie.posterPath), nameMovie: movie.title)

            }.disposed(by: disposeBag)
        
        output.selectedPost
            .do(onNext: { movie in
               Navigation.pushTabBarViewController(viewController: self, movie: movie)
            })
            .drive()
            .disposed(by: disposeBag)
        
        output.error
            .do(onNext: { element in
                print("Error: \(element)")
            })
            .drive()
            .disposed(by: disposeBag)
        
        let collectionViewFlow = sizeCollectionVerticalViewFlow(size: view.frame.width / CGFloat(2) - 8)
        collectionView.setCollectionViewLayout(collectionViewFlow, animated: true)
    }

    private func sizeCollectionVerticalViewFlow(size: CGFloat) -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 4, right: 2)
        flowLayout.itemSize = CGSize(width: size, height: size * 1.5)
        flowLayout.minimumLineSpacing = 4.0
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.invalidateLayout()
        return flowLayout
    }
    
}
