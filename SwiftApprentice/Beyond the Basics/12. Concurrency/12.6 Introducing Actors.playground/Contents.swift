import Cocoa

//class Playlist {
//    let title: String
//    let author: String
//    private(set) var songs: [String]
//
//    init(title: String, author: String, songs: [String]) {
//        self.title = title
//        self.author = author
//        self.songs = songs
//    }
//
//    func add(song: String) {
//        songs.append(song)
//    }
//
//    func remove(song: String) {
//        guard !songs.isEmpty, let index = songs.firstIndex(of: song) else {
//            return
//        }
//        songs.remove(at: index)
//    }
//
//    func move(song: String, from playlist: Playlist) {
//        playlist.remove(song: song)
//        add(song: song)
//    }
//
//    func move(song: String, to playlist: Playlist) {
//        playlist.add(song: song)
//        remove(song: song)
//    }
//}

actor Playlist {
    let title: String
    let author: String
    private(set) var songs: [String]

    init(title: String, author: String, songs: [String]) {
        self.title = title
        self.author = author
        self.songs = songs
    }

    func add(song: String) {
        songs.append(song)
    }

    func remove(song: String) {
        guard !songs.isEmpty, let index = songs.firstIndex(of: song) else {
            return
        }
        songs.remove(at: index)
    }

    func move(song: String, from playlist: Playlist) async {
        await playlist.remove(song: song)
        add(song: song)
    }

    func move(song: String, to playlist: Playlist) async {
        await playlist.add(song: song)
        remove(song: song)
    }
}



let favorites = Playlist(title: "Favorite songs", author: "Ehab", songs: ["Where My Heart Will Take Me"])
let partyPlaylist = Playlist(title: "Party songs", author: "Ray", songs: ["Stairway to Heaven"])
Task {
    await favorites.move(song: "Stairway to Heaven", from: partyPlaylist)
    await favorites.move(song: "Where My Heart Will Take Me", to: partyPlaylist)
    await print(favorites.songs)
}



extension Playlist: CustomStringConvertible {
    nonisolated var description: String {
        "\(title) by \(author)."
    }
}
print(favorites)
