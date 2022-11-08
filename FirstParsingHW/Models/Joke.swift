//
//  Beer.swift
//  FirstParsingHW
//
//  Created by Roman on 04.11.2022.
//

struct Joke: Decodable {
    let error: Bool
    let category: String?
    let type: String?
    let setup: String?
    let delivery: String?
    let joke: String?
    let flags: [String: Bool]
    let id: Int
    let safe: Bool
    let lang: String
}
