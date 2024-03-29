//
//  LocationInputViewActivationView.swift
//  OrduTaxi
//
//  Created by lil ero on 18.07.2020.
//  Copyright © 2020 lil ero. All rights reserved.
//

import UIKit

protocol LocationInputViewActivationViewDelegate : class {
    func presentLocationInputView()
}

class LocationInputViewActivationView: UIView{
    
    //MARK: - Properties
    
    weak var delegate : LocationInputViewActivationViewDelegate?
    
    private let indicatorView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let placeHolderLabel : UILabel = {
        let label = UILabel()
        label.text = "Nereye ?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
       configureUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentLocationInputView))
        addGestureRecognizer(tap)
        
        
    }
    func configureUI() {
        backgroundColor = .white
        addShadow()
        
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(height: 6, width: 6)
        
        addSubview(placeHolderLabel)
        placeHolderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func presentLocationInputView(){
        delegate?.presentLocationInputView()
    }
    
}
