import Cocoa

func findTitle(url: URL) async throws -> String? {
    for try await line in url.lines {
        if line.contains("<title>") {
            return line.trimmingCharacters(in: .whitespaces)
        }
    }
    return nil
}

Task {
    if let title = try await findTitle(url: URL(string:"https://www.kodeco.com")!) {
        print(title)
    }
}
