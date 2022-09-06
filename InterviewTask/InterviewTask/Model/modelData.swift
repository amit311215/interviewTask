//
//  File.swift
//  InterviewTask
//
//  Created by Amit Gohel on 05/09/22.
//

import Foundation

struct CompanyResponse: Codable {
    let headquarters: HeadquartersModel?
    let links: LinksModel?
    let name, founder: String?
    let founded: Int?
    let employees: Int?
    let vehicles: Int?
    let launchSites: Int?
    let testSites: Int?
    let ceo: String?
    let cto: String?
    let coo: String?
    let ctoPropulsion: String?
    let valuation: Int?
    let summary: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case headquarters, links, name, founder, founded, employees, vehicles
        case launchSites = "launch_sites"
        case testSites = "test_sites"
        case ceo, cto, coo
        case ctoPropulsion = "cto_propulsion"
        case valuation, summary, id
    }
}

// MARK: - Headquarters
struct HeadquartersModel: Codable {
    let address: String?
    let city: String?
    let state: String?
}

// MARK: - Links
struct LinksModel: Codable {
    let website: String?
    let flickr: String?
    let twitter: String?
    let elonTwitter: String?

    enum CodingKeys: String, CodingKey {
        case website, flickr, twitter
        case elonTwitter = "elon_twitter"
    }
}

struct LaunchesResponse : Codable{
    let name: String?
    let date_utc: String? // "2014-04-18T19:25:00.000Z",
    let rocket: String?
    let links: LinksPatchModel?
    let success: Bool?
    let date_local: String?
    
}
struct LinksPatchModel : Codable{
    let article: String?
    let patch: PatechImageModel?
}
struct PatechImageModel : Codable{
    let small: String?
    let large: String?
}

//[
//  {
//    "fairings": {
//      "reused": false,
//      "recovery_attempt": false,
//      "recovered": false,
//      "ships": [
//
//      ]
//    },
//    "links": {
//      "patch": {
//        "small": "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
//        "large": "https://images2.imgbox.com/5b/02/QcxHUb5V_o.png"
//      },
//      "reddit": {
//        "campaign": null,
//        "launch": null,
//        "media": null,
//        "recovery": null
//      },
//      "flickr": {
//        "small": [
//
//        ],
//        "original": [
//
//        ]
//      },
//      "presskit": null,
//      "webcast": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
//      "youtube_id": "0a_00nJ_Y88",
//      "article": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
//      "wikipedia": "https://en.wikipedia.org/wiki/DemoSat"
//    },
//    "static_fire_date_utc": "2006-03-17T00:00:00.000Z",
//    "static_fire_date_unix": 1142553600,
//    "net": false,
//    "window": 0,
//    "rocket": "5e9d0d95eda69955f709d1eb",
//    "success": false,
//    "failures": [
//      {
//        "time": 33,
//        "altitude": null,
//        "reason": "merlin engine failure"
//      }
//    ],
//    "details": "Engine failure at 33 seconds and loss of vehicle",
//    "crew": [
//
//    ],
//    "ships": [
//
//    ],
//    "capsules": [
//
//    ],
//    "payloads": [
//      "5eb0e4b5b6c3bb0006eeb1e1"
//    ],
//    "launchpad": "5e9e4502f5090995de566f86",
//    "flight_number": 1,
//    "name": "FalconSat",
//    "date_utc": "2006-03-24T22:30:00.000Z",
//    "date_unix": 1143239400,
//    "date_local": "2006-03-25T10:30:00+12:00",
//    "date_precision": "hour",
//    "upcoming": false,
//    "cores": [
//      {
//        "core": "5e9e289df35918033d3b2623",
//        "flight": 1,
//        "gridfins": false,
//        "legs": false,
//        "reused": false,
//        "landing_attempt": false,
//        "landing_success": null,
//        "landing_type": null,
//        "landpad": null
//      }
//    ],
//    "auto_update": true,
//    "tbd": false,
//    "launch_library_id": null,
//    "id": "5eb87cd9ffd86e000604b32a"
//  },
//
