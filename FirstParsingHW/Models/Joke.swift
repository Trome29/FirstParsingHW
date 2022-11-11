//
//  Beer.swift
//  FirstParsingHW
//
//  Created by Roman on 04.11.2022.
//

struct Joke: Decodable {
    let category: String
    let type: String
    let setup: String?
    let delivery: String?
    let joke: String?
    //let flags: Flags
    
    enum CodingKeys: CodingKey {
        case category
        case type
        case setup
        case delivery
        case joke
    }
    
//    init(category: String, type: String, setup: String?, delivery: String?, joke: String?) {
//        self.category = category
//        self.type = type
//        self.setup = setup
//        self.delivery = delivery
//        self.joke = joke
//    }
    
    init(jokeData: [String: Any]) {
        category = jokeData["category"] as? String ?? ""
        type = jokeData["type"] as? String ?? ""
        setup = jokeData["setup"] as? String ?? ""
        delivery = jokeData["delivery"] as? String ?? ""
        joke = jokeData["joke"] as? String ?? ""
    }
    
    static func getJoke(from value: Any) -> Joke {
        guard let jokeData = value as? [String: Any] else { return value as! Joke} //change
        let joke = Joke(jokeData: jokeData)
        return joke
    }
}

struct Flags: Decodable {
    let nsfw: Bool
    let religious: Bool
    let political: Bool
    let racist: Bool
    let sexist: Bool
    let explicit: Bool
}
