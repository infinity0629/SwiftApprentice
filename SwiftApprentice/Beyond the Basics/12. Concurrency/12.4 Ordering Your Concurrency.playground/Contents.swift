import Cocoa

func findTitle(url: URL) async throws -> String? {
    for try await line in url.lines {
        if line.contains("<title>") {
            return line.trimmingCharacters(in: .whitespaces)
        }
    }
    return nil
}

func findTitlesSerial(first: URL, second: URL) async throws -> (String?, String?) {
    let title1 = try await findTitle(url: first)
    let title2 = try await findTitle(url: second)
    return (title1, title2)
}

func findTitlesParallel(first: URL, second: URL) async throws -> (String?, String?) {
    async let title1 = findTitle(url: first)
    async let title2 = findTitle(url: second)
    let titles = try await [title1, title2]
    return (titles[0], titles[1])
}
