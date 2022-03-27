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
//        regularExpressionEmptyFirstCase();
//        regularExpressionEmptySecondCase();
//        regularExpressionEmptyThiredCase();
//        regularExpressionEmptyForthCase();
        //
        regularExpressionPhoneFirstCase();
        regularExpressionPhoneSecondCase();
        regularExpressionPhoneThiredCase();
        regularExpressionPhoneForthCase();
        regularExpressionPhoneFifthCase();
        regularExpressionPhoneSexthCase();
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func regularExpressionPhoneFirstCase(){
        var resultValue = RegularExpression.phone.regex.matches(input:"0597105861");
        XCTAssertEqual(resultValue,true);
    }
    func regularExpressionPhoneSecondCase(){
        var resultValue = RegularExpression.phone.regex.matches(input:"00972597105861");
        XCTAssertEqual(resultValue,true);
    }
    func regularExpressionPhoneThiredCase(){
        var resultValue = RegularExpression.phone.regex.matches(input:"+972597105861");
        XCTAssertEqual(resultValue,true);
    }
    func regularExpressionPhoneForthCase(){
        var resultValue = RegularExpression.phone.regex.matches(input:"");
        XCTAssertEqual(resultValue,false);
    }
    func regularExpressionPhoneFifthCase(){
        var resultValue = RegularExpression.phone.regex.matches(input:"123");
        XCTAssertEqual(resultValue,false);
    }
    func regularExpressionPhoneSexthCase(){
        var resultValue = RegularExpression.phone.regex.matches(input:"a22");
        XCTAssertEqual(resultValue,false);
    }
    // MARK: -RegularExpression
    func regularExpressionEmptyFirstCase(){
        var resultValue = RegularExpression.empty.regex.matches(input:"");
        XCTAssertEqual(resultValue,true);
    }
    func regularExpressionEmptySecondCase(){
        var resultValue = RegularExpression.empty.regex.matches(input:"a a a");
        XCTAssertEqual(resultValue, false);
    }
    func regularExpressionEmptyThiredCase(){
        var resultValue = RegularExpression.empty.regex.matches(input:"  ");
        XCTAssertEqual(resultValue, true);
    }
    func regularExpressionEmptyForthCase(){
        var  test = """
"""
        var resultValue = RegularExpression.empty.regex.matches(input:test);
        XCTAssertEqual(resultValue, true);
    }
        //..
    func regularExpressionEmailFirstCase(){
        var resultValue = RegularExpression.email.regex.matches(input:"salah.mohamed_1995@hotmail.com");
        XCTAssertEqual(resultValue, true);
    }
    func regularExpressionEmailSecondCase(){
        var resultValue = RegularExpression.email.regex.matches(input:"ads");
        XCTAssertEqual(resultValue, false);
    }
    func regularExpressionEmailThiredCase(){
        var resultValue = RegularExpression.email.regex.matches(input:"123456");
        XCTAssertEqual(resultValue, false);
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
