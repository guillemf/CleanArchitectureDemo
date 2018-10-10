class Wireframe {
    private let features = Trie()
    private let routing = RoutingTable()
    private (set) var presenter: Presenter?
    
    func addRouting(origin: String, condition: String, destiny: String) {
        let newRoute = Routing(origin: origin, condition: condition, destiny: destiny)
        routing.add(newRoute)
    }
    
    func addFeature(_ builder: @escaping PresenterBuilder, at location: String) {
        do {
            try features.insert(builder, at: location)
        } catch TrieError.emptyRoute {
            print("Error: Can't insert a route at an empty location")
        } catch TrieError.routeAlreadyExists {
            print("Error: \(location) already is inserted")
        } catch {
            print("Error: Unexpeted error")
        }
    }
    
    func navigate(from: String, data: [String: AnyObject]) {
        do {
            var action = ""
            
            if let result = data["result"] as? String { action = "result: \(result)" }
            
            let feature = try routing.getDestiny(for: from, withAction: action)
            
            guard let presenterBuilder = try features.getPresenter(at: feature) else { return }
            
            presenter = presenterBuilder()
            
        } catch RoutingError.unexistingRoute {
            print("Unexisting route \(from) with action \(data) requestedf")
        } catch TrieError.unexistingFeature {
            print("Unexisting feature requested for \(from) with action \(data)")
        } catch {
            print("Unknown error")
        }
    }

}
