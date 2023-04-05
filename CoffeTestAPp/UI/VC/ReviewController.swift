//
//  ReviewController.swift
//  CoffeTestAPp
//
//  Created by Smith Sese on 05/04/2023.
//

import Foundation
import LBTATools


class ReviewController: UIViewController, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
   
    
    
    
    var collectionView: UICollectionView!
    var orders = [Order]()
    
    
    let totalPrice = UILabel(text: "20.00")
    let subTotal = UILabel(text: "10.0")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        
        view.addSubview(collectionView)
        collectionView.withHeight(view.frame.height * 0.35)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        collectionView.backgroundColor = .white
        
        
        
        collectionView.register(SummaryCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let mView = UIView()
        
        mView.stack(
            UIView().hstack(
                UILabel(text: "Total Price:"),
                totalPrice,
                alignment: .center,
                distribution: .fillEqually
            ),
            UIView().hstack(
                UILabel(text: "Sub Total Price:"),
                subTotal,
                alignment: .center,
                distribution: .fillEqually
            ),
            UIView(),
            spacing: 10
        )
        view.addSubview(mView)
        
        
        mView.anchor(top: collectionView.bottomAnchor, leading: collectionView.leadingAnchor, bottom: view.bottomAnchor, trailing: collectionView.trailingAnchor)
        
        let price = orders.reduce(0.0) {$0 + (Double($1.quantiy) * ($1.item.price))}
        
        totalPrice.text = "Ghc \(price)"
        subTotal.text = "Ghc \(price)"
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SummaryCell
        
        let model = orders[indexPath.item]
        
        cell.totalPrice.text = "Ghc \(Double(model.quantiy) * model.item.price)"
        cell.quantityLabel.text = "x \(model.quantiy)"
        cell.titleLabel.text = model.item.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 50)
    }
    
    
}
