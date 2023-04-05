//
//  ViewController.swift
//  CoffeTestAPp
//
//  Created by Smith Sese on 05/04/2023.
//

import UIKit
import LBTATools


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var items = [
        Order(item: Item(name: "Cuppicino", description: "Cuppicino description", price: 10.0), quantiy: 0),
        Order(item: Item(name: "Coffee", description: "Coffee description", price: 10.0), quantiy: 0),
        Order(item: Item(name: "Tea ", description: "Cuppicino description", price: 10.0), quantiy: 0)
    ]
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .red
        navigationItem.title = "Mini Store"
         
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        view.addSubview(collectionView)
        collectionView.fillSuperview(padding: .allSides(5))
        collectionView.backgroundColor = .white
        
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let button = UIButton(title: "Cart", titleColor: .white)
        button.withHeight(50)
        
        button.backgroundColor = .black
        view.addSubview(button)
        button.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(onCartTaped), for: .touchUpInside)
        
    }
    
    @objc func onCartTaped() {
        
        let orders = items.filter { $0.quantiy > 0}
        let vc = ReviewController()
        vc.orders = orders
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func onMinusTapped(index: Int) {
        var item = items[index]
        if item.quantiy > 0 {
            item.quantiy = item.quantiy - 1
            items[index] = item
            collectionView.reloadData()
        }
        
    }
    
    public func onAddTapped(index: Int) {
        var item = items[index]
        item.quantiy = item.quantiy + 1
        items[index] = item
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCell
        let model = items[indexPath.item]
        item.priceLabel.text = " GHc \(model.item.price)"
        item.nameLabel.text = model.item.name
        item.quantityLabel.text = "\(model.quantiy)"
        item.viewController = self
        item.indexPath = indexPath
        
        return item
    }
    


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 80)
    }

}

