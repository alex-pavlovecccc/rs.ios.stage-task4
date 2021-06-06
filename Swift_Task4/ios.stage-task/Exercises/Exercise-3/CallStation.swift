import Foundation

final class CallStation {
    var baseUser: [User] = []
    var callArray: [Call] = []
    
}

extension CallStation: Station {
    func users() -> [User] {
        return baseUser
    }
    
    func add(user: User) {
        if !baseUser.contains(user) {
            baseUser.append(user)}
    }
    
    func remove(user: User) {
        if !baseUser.contains(user) {
            baseUser.remove(at: baseUser.firstIndex(of: user) ?? 0) }
    }
    
    func execute(action: CallAction) -> CallID? {
        
        let call: Call
        let uuid: CallID = UUID()
        
        switch action {
        case .start(from: let from, to: let to):
            
            if !baseUser.contains(from) && !baseUser.contains(to) {
                return nil
            } else if !baseUser.contains(to) {
                call = Call(id: uuid, incomingUser: from, outgoingUser: to, status: .ended(reason: .error))
                return call.id
            }
            
//            let call = Call(id: UUID.init(), incomingUser: from, outgoingUser: to, status: .calling)
//                            callArray.append(call)
            
        default:
            return nil
        }
        return nil
    }
    
    func calls() -> [Call] {
        return callArray
    }
    
    func calls(user: User) -> [Call] {
        return callArray
    }
    
    func call(id: CallID) -> Call? {
        nil
    }
    
    func currentCall(user: User) -> Call? {
        nil
    }
}
