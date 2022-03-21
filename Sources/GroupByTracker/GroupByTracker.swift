import Foundation

public struct GroupByTracker {
    public private(set) var text = "Hello, World!"
    public var clientId = ""

    public init(clientId: String) {
        self.clientId = clientId;
    }
    
    public func test(_ date: Date) -> String? {
        return self.clientId + " "  + (convertFromDate(date) ?? "*no date*");
    }
    
    func convertFromDate(_ date: Date) -> String? {
        let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = Configuration.dateFormat
            formatter.calendar = NSCalendar(calendarIdentifier: .gregorian)! as Calendar
            formatter.timeZone = TimeZone.current
            return formatter
        }()

        let date = formatter.string(from: date)
        return date
    }
}
