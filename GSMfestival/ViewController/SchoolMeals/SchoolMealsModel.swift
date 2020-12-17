//
//  SchoolMealsModel.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/17.
//

import Foundation

struct mealResponse: Codable{
    var mealServiceDietInfo: [MealServiceDietInfo]
}

struct MealServiceDietInfo: Codable{
    var row: [Row]?
}

struct Row: Codable{
    var dishName: String
    var schoolMealDate: String
    var schoolMealTime: String
    
    enum CodingKeys : String, CodingKey{
        case dishName = "DDISH_NM"
        case schoolMealDate = "MLSV_YMD"
        case schoolMealTime = "MMEAL_SC_NM"
    }
}


struct mealRequest: Codable {
    let key: String
    let requestType: String
    let pageIndex: Int
    let pageSize: Int
    let schoolRegionCode: String
    let schoolCode: String
    let schoolMealCode: String // 급식코드
    let schoolMealDate: String // 급식일자
    
    enum CodingKeys : String, CodingKey{
        case key = "KEY"
        case requestType = "Type"
        case pageIndex = "pIndex"
        case pageSize = "pSIze"
        case schoolRegionCode = "ATPT_OFCDC_SC_CODE"
        case schoolCode = "SD_SCHUL_CODE"
        case schoolMealCode = "MMEAL_SC_CODE"
        case schoolMealDate = "MLSV_YMD"
    }

}

