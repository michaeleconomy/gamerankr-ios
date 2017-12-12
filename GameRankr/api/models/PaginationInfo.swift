struct PaginationInfo {
    let currentPage: Int
    let perPage: Int
    let totalResults: Int
    func numPages() -> Double {
        return (Double(totalResults) / Double(perPage)).rounded(.up)
    }
}
