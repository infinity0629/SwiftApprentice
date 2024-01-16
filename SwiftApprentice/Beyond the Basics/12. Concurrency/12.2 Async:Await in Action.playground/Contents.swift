import Cocoa

struct Domains: Decodable {
    let data: [Domain]
}

struct Domain: Decodable {
    let attributes: Attributes
}

struct Attributes: Decodable {
    let name: String
    let description: String
    let level: String
}

func fetchDomains() async throws -> [Domain] {
    let url = URL(string: "https://api.kodeco.com/api/domains")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(Domains.self, from: data).data
}

Task {
    do {
        let domains = try await fetchDomains()
        for domain in domains {
            let attr = domain.attributes
            print("\(attr.name): \(attr.description) - \(attr.level)")
        }
    } catch {
        print(error)
    }
}
