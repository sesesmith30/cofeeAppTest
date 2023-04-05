//
//  SummaryCell.swift
//  CoffeTestAPp
//
//  Created by Smith Sese on 05/04/2023.
//

import Foundation
import LBTATools


class SummaryCell: UICollectionViewCell {
    
    
    let totalPrice = UILabel(text: "Ghc 200.0",font: UIFont.boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Title here")
    let quantityLabel = UILabel(text: "x6")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public func setupUIComponent() {
        
        let view = UIView()
        
        addSubview(view)
        view.fillSuperview()
        
        view.hstack(
            UIView().stack(
                titleLabel,
                quantityLabel,
                alignment: UIStackView.Alignment.center,
                distribution: UIStackView.Distribution.fillEqually
            ),
            totalPrice,
            spacing: 8,
            alignment: UIStackView.Alignment.center,
            distribution: UIStackView.Distribution.equalSpacing
        ).withMargins(.init(top: 5, left: 8, bottom: 8, right: 8))
        
        
    }
    
    
    
}
