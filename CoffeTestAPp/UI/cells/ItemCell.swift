//
//  ItemCell.swift
//  CoffeTestAPp
//
//  Created by Smith Sese on 05/04/2023.
//

import Foundation
import UIKit

class ItemCell : UICollectionViewCell {
    
    
    let nameLabel = UILabel(text: "Cuppicino", font: UIFont.preferredFont(forTextStyle: .body), textColor: .black, textAlignment: .left, numberOfLines: 2)
    let priceLabel = UILabel(text: "$50.00", font: UIFont.systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .left, numberOfLines: 1)
    
    let plusBtn = UIButton(title: "+", titleColor: .black)
    let minusBtn = UIButton(title: "-", titleColor: .black)
    let quantityLabel = UILabel(text: "0")
    var viewController: ViewController?
    var indexPath: IndexPath!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onPlusTapped() {
        viewController?.onAddTapped(index: indexPath.item)
    }
    
    @objc func onMinusTapped() {
        viewController?.onMinusTapped(index: indexPath.item)
    }
    
    
    
    public func setupUIComponent() {
        
        let view = UIView()
        
        addSubview(view)
        view.fillSuperview()
        
        plusBtn.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)
        minusBtn.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        
        view.hstack(
            UIView().stack(
                nameLabel,
                priceLabel,
                alignment: UIStackView.Alignment.center,
                distribution: UIStackView.Distribution.equalSpacing
            ),
            UIView().hstack(
                minusBtn,
                quantityLabel,
                plusBtn,
                alignment: UIStackView.Alignment.center,
                distribution: UIStackView.Distribution.equalCentering
            ),
            spacing: 8,
            alignment: UIStackView.Alignment.center,
            distribution: UIStackView.Distribution.equalSpacing
        ).withMargins(.init(top: 5, left: 8, bottom: 8, right: 8))
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
