//
//  FavCategoryIcons.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

struct FavCategoryIcons {
    
    static func iconName() -> String {
        if let name = iconNames.randomElement() {
            return name
        } else {
            return ""
        }
    }
    
    static func iconNames(_ number: Int) -> [String] {
        var names: [String] = []
        for _ in 0..<number {
            names.append(iconName())
        }
        return names
    }
        
    static var iconNames: [String] = [
        "music.mic",
        "music.quarternote.3",
        "tv.fill",
        "popcorn.fill",
        "calendar",
        "book.fill",
        "book.closed.fill",
        "magazine.fill",
        "graduationcap.fill",
        "person.fill",
        "figure.walk",
        "figure.run",
        "mic.fill",
        "play.rectangle.fill",
        "circle.fill",
        "square.fill",
        "questionmark.app.fill",
        "heart.fill",
        "heart.slash.fill",
        "star.fill",
        "flag.fill",
        "camera.fill",
        "message.fill",
        "star.bubble.fill",
        "video.fill",
        "paintbrush.pointed.fill",
        "theatermasks.fill",
        "house.fill",
        "party.popper.fill",
        "tent.fill",
        "headphones",
        "airpods",
        "car.fill",
        "airplane",
        "tram.fill",
        "bird.fill",
        "fish.fill",
        "teddybear.fill",
        "tree.fill",
        "film.fill",
        "ticket.fill",
        "gift.fill",
        "fork.knife",
    ]
}
