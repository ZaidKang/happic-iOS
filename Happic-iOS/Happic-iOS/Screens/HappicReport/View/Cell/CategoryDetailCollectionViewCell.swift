//
//  CategoryDetailCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

final class CategoryDetailCollectionViewCell: UICollectionViewCell {
    // MARK: - UI
    private lazy var categoryNameLabel = UILabel().then {
        $0.text = "#who 1"
        $0.textColor = .hpGray5
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var userKeywordLabel = UILabel().then {
        $0.text = "햄식이"
        $0.textColor = .hpGray2
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 16)
    }
    
    private lazy var countLabel = UILabel().then {
        $0.text = "xx회"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardMedium, ofSize: 16)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        backgroundColor = .hpGray9
        layer.cornerRadius = 10

        addSubviews(categoryNameLabel, userKeywordLabel, countLabel)
        categoryNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        userKeywordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(94)
            make.centerY.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(42)
            make.centerY.equalToSuperview()
        }
    }
    
    func setCategoryNameLabel(type: CategoryType, index: Int) {
        switch type {
        case .whenCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#when ", index: index)
        case .whereCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#where ", index: index)
        case .whoCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#who ", index: index)
        case .whatCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#what ", index: index)
        }
    }
    
    func makeCategoryString(category: String, index: Int) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: category,
                                                         attributes:
                                                            [.font: UIFont.font(.pretendardRegular, ofSize: 14), .foregroundColor: UIColor.gray])
        attributedString.append(NSAttributedString(string: String(index),
                                                   attributes: [.font: UIFont.font(.pretendardBold, ofSize: 14),
                                                    .foregroundColor: UIColor.gray]))
        return attributedString
    }
}
