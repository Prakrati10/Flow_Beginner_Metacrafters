import PersonInformationContract from 0x05

pub fun main(personID: UInt64): PersonInformationContract.Person? {
    log("Kndly Review Your Info")
    return PersonInformationContract.getPerson(personID: personID)!
}