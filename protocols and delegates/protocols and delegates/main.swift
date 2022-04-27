
protocol AdvanceMedicalsSupport {
    func doCPR()
}

class EmergencySupport {
    var delegate: AdvanceMedicalsSupport?
    
    func declareEmergency() {
        delegate?.doCPR()
    }
}

struct Paramedic: AdvanceMedicalsSupport {
    func doCPR() {
        print("Do CPR PROCEDURE")
    }
    
    init(personnel: EmergencySupport) {
        personnel.delegate = self
    }
}

let jim = EmergencySupport()
let doe = Paramedic(personnel: jim)

jim.declareEmergency()

