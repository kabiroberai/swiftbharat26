import OpenAPIURLSession
import OpenAPIRuntime

let api = Client(
    serverURL: try! Servers.Server1.url(),
    transport: URLSessionTransport(),
)

extension HTTPBody {
    func text() async throws -> String {
        var bytes: [UInt8] = []
        for try await chunk in self {
            bytes.append(contentsOf: chunk)
        }
        return String(decoding: bytes, as: UTF8.self)
    }
}
