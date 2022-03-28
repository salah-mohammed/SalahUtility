//
//  SalahUtilityExampleTests.swift
//  SalahUtilityExampleTests
//
//  Created by Salah on 11/16/20.
//  Copyright © 2020 Salah. All rights reserved.
//
import SalahUtility
import XCTest
@testable import SalahUtilityExample

class SalahUtilityExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        regularExpressionPhone();
        regularExpressionEmpty();
        regularExpressionEmail();
        bs_removeTo()
        bs_removeFrom()
        bs_second()
        bs_thired()
        bs_beforeLast()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func regularExpressionPhone(){
        var value1 = RegularExpression.phone.regex.matches(input:"0597105861");
        XCTAssertEqual(value1,true);
        var value2 = RegularExpression.phone.regex.matches(input:"00972597105861");
        XCTAssertEqual(value2,true);
        var value3 = RegularExpression.phone.regex.matches(input:"+972597105861");
        XCTAssertEqual(value3,true);
        var value4 = RegularExpression.phone.regex.matches(input:"");
        XCTAssertEqual(value4,false);
        var value5 = RegularExpression.phone.regex.matches(input:"123");
        XCTAssertEqual(value5,false);
        var value6 = RegularExpression.phone.regex.matches(input:"a22");
        XCTAssertEqual(value6,false);
    }

    // MARK: -RegularExpression
    func regularExpressionEmpty(){
        var value1 = RegularExpression.empty.regex.matches(input:"");
        XCTAssertEqual(value1,true);
        var value2 = RegularExpression.empty.regex.matches(input:"a a a");
        XCTAssertEqual(value2, false);
        var value3 = RegularExpression.empty.regex.matches(input:"  ");
        XCTAssertEqual(value3, true);
        var  test = """
"""
        var value4 = RegularExpression.empty.regex.matches(input:test);
        XCTAssertEqual(value4, true);
    }
        //..
    func regularExpressionEmail(){
        let value1 = RegularExpression.email.regex.matches(input:"salah.mohamed_1995@hotmail.com");
        XCTAssertEqual(value1, true);
        let value2 = RegularExpression.email.regex.matches(input:"ads");
        XCTAssertEqual(value2, false);
        let value3 = RegularExpression.email.regex.matches(input:"123456");
        XCTAssertEqual(value3, false);
    }
    
    
    // MARK: -Array
    func bs_removeTo() {
        var items = ["1","2","3","4"];
        items.bs_removeTo(index: 1);
        let resultValue = (items.first == "3")
        XCTAssertEqual(resultValue, true);
    }
    func bs_removeFrom(){
        var items = ["1","2","3","4"];
        items.bs_removeFrom(0, toIndex: 2);
        let resultValue = ((items.first == "4") && (items.count==1))
        XCTAssertEqual(resultValue, true);
    }
    func bs_second(){
        let items = ["1","2","3","4"];
        let  resultValue = (items.bs_second as? String == "2")
        XCTAssertEqual(resultValue, true);
    }
    func bs_thired(){
        let items = ["1","2","3","4"];
        let  resultValue = (items.bs_thired as? String == "3")
        XCTAssertEqual(resultValue, true);
    }
    func bs_beforeLast(){
        let items = ["1","2","3","4"];
        let  resultValue = (items.bs_beforeLast as? String == "3")
        XCTAssertEqual(resultValue, true);

    }
    

}
