## Introduction To Project

For this Project, developer have to build structs, a fundamental concept covered in the previous module. The objective entails deploying a new contract containing a struct distinct from Profile, establishing a dictionary or array to store instances of the defined struct, creating a function to append entries to the array/dictionary, adding a transaction to invoke the aforementioned function, and developing a script to read the defined struct. Upon completion, participants are required to post their code on GitHub, culminating in a comprehensive exercise reinforcing their understanding of structs in smart contract development.

## Contract Introduction

```cadence
pub contract PersonInformationContract {

    pub struct Person {
        pub let fullName: String
        pub let personID: UInt64

        init(fullName: String, personID: UInt64) {
            self.fullName = fullName
            self.personID = personID
        }
    }

    pub var people: {UInt64: Person}

    init() {
        self.people = {}
        log("Successfully Deployed")
    }

    pub fun addPerson(fullName: String, personID: UInt64) {
        let person = Person(fullName: fullName, personID: personID)
        self.people[personID] = person
    }

    pub fun getPerson(personID: UInt64): Person? {
        return self.people[personID]
    }
}
```

The PersonInformationContract is a smart contract designed to manage and store information about individuals. At its core lies a struct named Person, which encapsulates two properties: fullName, representing the full name of the person as a string, and personID, a unique identifier represented as a 64-bit unsigned integer. The init function within the struct serves as the constructor, initializing the struct with the provided values of fullName and personID.

The contract also declares a variable named people, which is a dictionary mapping UInt64 keys to Person values. This dictionary is used to store instances of the Person struct, with each person identified by their unique personID.

The contract's initializer function (init()) initializes an empty dictionary for people and logs a message indicating successful deployment.

Two additional functions are provided: addPerson and getPerson. The addPerson function enables the addition of a new person to the contract's storage. It takes fullName and personID as parameters, creates a new Person instance with the provided details, and adds it to the people dictionary using the personID as the key.

Conversely, the getPerson function allows retrieval of a person's information based on their personID. It returns an optional Person instance corresponding to the provided personID. If the person with the specified ID exists in the people dictionary, their information is returned; otherwise, nil is returned.

## Basci Concept

The PersonInformationContract is a smart contract deployed on a Flow playground platform, a language is Cadence. The contract is designed to store and manage information about individuals information within the blockchain network.

At its core, the contract utilizes a struct called Person to represent individual entities. This struct encapsulates essential attributes of a person, such as their full name (fullName) and a unique identifier (personID). These attributes are defined within the struct and initialized through the init function, which acts as a constructor.

The contract maintains a dictionary named people, where each entry corresponds to a unique personID mapped to its respective Person struct. This data structure facilitates efficient storage and retrieval of individual records within the contract.

To interact with the contract, two primary functions are provided: addPerson and getPerson. The addPerson function allows users to add new individuals to the contract by providing their full name and a unique identifier. Upon invocation, this function creates a new Person instance with the specified attributes and stores it in the people dictionary.

Conversely, the getPerson function enables users to retrieve information about individuals based on their unique identifier (personID). By supplying the desired personID as an argument, users can query the contract to obtain the corresponding Person struct, facilitating access to individual records stored within the contract.
