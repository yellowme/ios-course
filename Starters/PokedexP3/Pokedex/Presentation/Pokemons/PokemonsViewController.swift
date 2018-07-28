//
//  MasterViewController.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class PokemonsViewController: BaseViewController {
    
    //MARK: - Variables (Extract to PokemonsViewController+Constants)
    
    private let numberOfColumns: CGFloat = 3.0
    private let minSpacing: CGFloat = 3.0
    private let dataHelper = PokemonsService()
    var cellDecorator: AppCollectionCellDecorator<PokemonCollectionViewCell, Pokemon>?    
    var pokemons: [Pokemon] = [] //Temporal variable
    
    //MARK: - Outlets
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dataSource = AppDataSource(array: [])
        cellDecorator = PokemonCollectionCellDecorator()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.searchBar.delegate = self
        
        //TODO: Group to method and extract to internal extension method
        registerPokemonCell()
        setCollectionViewSpacing()
        addPokedexLogo()
        decorateFilterButton()
        decorateSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    //MARK: - Loading Data (Extract to Presenter)
    
    func loadData(name: String? = nil) {
        setProgress(to: true)
        dataHelper.getAllPokemons(name: name, parser: PokemonsParser()) { pokemons, error in
            self.setProgress(to: false)
            
            guard error == nil else {
                self.display(error!)
                return
            }
            
            guard let pokemons = pokemons, pokemons.count > 0 else {
                self.display(String.emptyList)
                return
            }
            
            DispatchQueue.main.async {
                self.pokemons = pokemons
                self.collectionView.reloadData()
            }
        }
    }
    
}

//MARK: - Search (Extract to +Ext file)
extension PokemonsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadData(name: searchText)
    }
}

//MARK: - Collection Cell
extension PokemonsViewController {
    private func registerPokemonCell() {
        let cellXib = UINib(nibName: PokemonCollectionViewCell.identifier, bundle: nil)
        collectionView.register(
            cellXib,
            forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier
        )
    }
    
    private func setCollectionViewSpacing(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - (minSpacing * 2)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width / numberOfColumns, height: width / numberOfColumns)
        layout.minimumInteritemSpacing = minSpacing
        layout.minimumLineSpacing = minSpacing
        
        collectionView!.collectionViewLayout = layout
    }
}

//MARK: Decoration (Extract to UIView+Styles)
extension PokemonsViewController {
    private func decorateFilterButton() {
        filterButton.layer.cornerRadius = 10
        filterButton.layer.borderWidth = 3
        filterButton.layer.borderColor = UIColor.white.cgColor
    }
    
    private func decorateSearchBar() {
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .vermillion
        searchBar.tintColor = .white
    }
}

//MARK: - Collection View
extension PokemonsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PokemonCollectionViewCell.identifier,
            for: indexPath
        ) as! PokemonCollectionViewCell
        
        let currentPokemon = pokemons[indexPath.row]
        DispatchQueue.main.async {
            self.cellDecorator?.decorate(cell: cell, using: currentPokemon)
        }
        return cell
    }
}

//MARK: - Base View (Extract to +Ext file)
extension PokemonsViewController: BaseView {
    func setProgress(to isLoading: Bool, with alpha: CGFloat? = nil, overlay: UIColor? = nil) {
        guard let parentView = self.parent?.view else { return }
        
        if isLoading {
            self.parent?.showIndicator(
                on: parentView,
                options: BaseViewIndicatorOptions(
                    indicatorColor: .blue,
                    alpha: 0.6,
                    overlayColor: .lightGray
                )
            )
        } else {
            self.parent?.hideActivityIndicator(on: parentView)
        }
    }
}
