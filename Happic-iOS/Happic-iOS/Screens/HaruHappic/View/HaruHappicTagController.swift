//
//  HaruHappicTagController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

// MARK: - Protocols
protocol HaruHappicTagControllerDelegate: AnyObject {
    func showDetailView(_ id: String)
}

final class HaruHappicTagController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: HaruHappicTagControllerDelegate?
    
    // MARK: - UI
    private lazy var customMonthView = CustomMonthView()
    private lazy var customMonthPickerView = CustomMonthPickerView()
    private lazy var containerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDelegate()
        setCollectionView()
    }
    
    // MARK: - Functions
    private func configureUI() {
        
        view.addSubviews(containerCollectionView, customMonthView, customMonthPickerView)
        
        containerCollectionView.backgroundColor = .clear
        
        customMonthView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        containerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(customMonthView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        customMonthPickerView.snp.makeConstraints { make in
            make.top.equalTo(customMonthView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(230)
        }
        customMonthPickerView.isHidden = true
    }
    
    private func setDelegate() {
        customMonthView.delegate = self
        customMonthPickerView.delegate = self
    }
    
    private func setCollectionView() {
        containerCollectionView.delegate = self
        containerCollectionView.dataSource = self
        containerCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.className)
    }
}

// MARK: - Extensions
extension HaruHappicTagController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.className, for: indexPath)
                as? TagCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.showDetailView("")
    }
}

extension HaruHappicTagController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension HaruHappicTagController: CustomMonthViewDelegate {
    func setMonthPickerView(_ isMonthViewEnabled: Bool) {
        customMonthPickerView.isHidden = isMonthViewEnabled ? false : true
    }
}

extension HaruHappicTagController: CustomMonthPickerViewDelegate {
    func changeMonthStatus(_ month: String) {
        if month.count == 1 {
            customMonthView.monthLabel.text = "2022 . 0\(month)"
        } else {
            customMonthView.monthLabel.text = "2022 . \(month)"
        }
    }
}
