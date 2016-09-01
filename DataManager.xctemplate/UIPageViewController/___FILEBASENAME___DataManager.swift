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
	typealias IndexPageListner = (index: Int) -> Void
	
	private var pageViewController: UIPageViewController! {
		didSet {
			pageViewController.dataSource = self
			pageViewController.delegate = self
		}
	}
	
	var pages: [UIViewController] = []
	private(set) var currentIndex = 0
	
	private var objects: <#[AnyObject]!#> {
		didSet {
			let storyboard = UIStoryboard(name: <#StoryboardIdentifier#>, bundle: <#NSBundle?#>)
			for object in objects {
				let vc = storyboard
					.instantiateViewControllerWithIdentifier(<#ViewControllerIdentifier#>)
				addViewController(vc)
			}
		}
	}
	private var indexPageListner: IndexPageListner!
	
	func configureDataManager(pageViewController pageViewController: UIPageViewController,
												withObjects objects: <#[AnyObject]#>,
											andIndexLisnter lisnter: IndexPageListner) {
		
		self.pageViewController = pageViewController
		self.objects = objects
		self.indexPageListner = lisnter
	}
	
	private func addViewController(viewController: UIViewController) {
		pages.append(viewController)
		
		if pages.count == 1 {
			pageViewController.setViewControllers([viewController],
			                                      direction:	.Forward,
			                                      animated:		true,
			                                      completion:	nil)
		}
	}
	
	func viewControllerIndex(viewController: UIViewController) -> Int? {
		return pages.indexOf(viewController)
	}
}

//MARK: UIPageViewControllerDelegate
extension ___FILEBASENAMEASIDENTIFIER___DataManager: UIPageViewControllerDelegate {
	
}

//MARK: UIPageViewControllerDataSource
extension ___FILEBASENAMEASIDENTIFIER___DataManager: UIPageViewControllerDataSource {
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
		return pages.count
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
		return currentIndex
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		let index = nextIndex(viewControllerIndex(viewController))
		return pages.at(index)
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
		let index = prevIndex(viewControllerIndex(viewController))
		return pages.at(index)
	}
}

//MARK: Extension
extension Array {
	
	func at(index: Int?) -> Element? {
		if let index = index where index >= 0 && index < endIndex {
			return self[index]
		} else {
			return nil
		}
	}
}

func nextIndex(x: Int?) -> Int? {
	return x?.successor()
}

func prevIndex(x: Int?) -> Int? {
	return x?.predecessor()
}

