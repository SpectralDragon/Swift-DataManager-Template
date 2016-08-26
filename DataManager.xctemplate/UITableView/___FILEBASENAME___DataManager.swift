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
	
	private var tableView: UITableView! {
		didSet {
			tableView.dataSource = self
			tableView.delegate = self
		}
	}
	private var object: <#[AnyObject]!#> {
		didSet {
			tableView.reloadData()
		}
	}
	private var rowDidClickListner: CellRowListner!
	
	func configureDataManager(tableView tableView: UITableView,
							  withObject object: <#[AnyObject]#>,
							  andRowLisnter lisnter: CellRowListner) {
		
		self.tableView = tableView
		self.object = object
		self.rowDidClickListner = lisnter
	}
}

//MARK: UITableViewDelegate
extension ___FILEBASENAMEASIDENTIFIER___DataManager: UITableViewDelegate {
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		rowDidClickListner(indexPath: indexPath)
	}
}

//MARK: UITableViewDataSource
extension ___FILEBASENAMEASIDENTIFIER___DataManager: UITableViewDataSource {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		<#code#>
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		<#code#>
	}
}
