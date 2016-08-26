//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

class ___FILEBASENAMEASIDENTIFIER___DataManager: NSObject {
	typealias CellRowListner = (indexPath: NSIndexPath) -> Void
	
	private var collectionView: UICollectionView! {
		didSet {
			collectionView.dataSource = self
			collectionView.delegate = self
		}
	}
	private var object: <#[AnyObject]!#> {
		didSet {
			tableView.reloadData()
		}
	}
	private var rowDidClickListner: CellRowListner!
	
	func configureDataManager(collectionView collectionView: UICollectionView,
							  withObject object: <#[AnyObject]#>,
							  andRowLisnter lisnter: CellRowListner) {
		
		self.collectionView = collectionView
		self.object = object
		self.rowDidClickListner = lisnter
	}
}

//MARK: UICollectionViewDelegate
extension ___FILEBASENAMEASIDENTIFIER___DataManager: UICollectionViewDelegate {
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		rowDidClickListner(indexPath: indexPath)
	}
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ___FILEBASENAMEASIDENTIFIER___DataManager: UICollectionViewDelegateFlowLayout {
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		<#code#>
	}
}

//MARK: UICollectionViewDataSource
extension ___FILEBASENAMEASIDENTIFIER___DataManager: UICollectionViewDataSource {
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		<#code#>
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		<#code#>
	}
}
