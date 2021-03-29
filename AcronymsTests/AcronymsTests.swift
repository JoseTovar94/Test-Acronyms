//
//  AcronymsTests.swift
//  AcronymsTests
//
//  Created by Jose Luis Tovar Jimenez on 26/03/21.
//

import XCTest
@testable import Acronyms

class AcronymsTests: XCTestCase {
    
    var viewControllerUnderTest: SearchViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.tableView)
    }
    
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.delegate)
    }
    
    func testHasASearchBar() {
        XCTAssertNotNil(viewControllerUnderTest.searchBar)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.numberOfSections(in:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }
    
    // MARK: - SearchBar
    
    func testSUT_HasSearchBar() {
        
        XCTAssertNotNil(viewControllerUnderTest.searchBar)
    }
    
    func testSUT_ShouldSetSearchBarDelegate() {
        
        XCTAssertNotNil(self.viewControllerUnderTest.searchBar.delegate)
    }
}
