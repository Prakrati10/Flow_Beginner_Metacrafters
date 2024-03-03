## Introduction To Objective

This project wants to make an existing NFT smart contract better by adding a new feature called borrowAuthNFT. This feature will let anyone read the information about NFTs stored on the blockchain. To do this, we'll create accounts, make NFTs, and write scripts to show how it works.

## CryptoPoops Introduction

```cadence
import NonFungibleToken from 0x05

pub contract CryptoPoops: NonFungibleToken {

  pub var totalSupply: UInt64

  pub event ContractInitialized()
  pub event Withdraw(id: UInt64, from: Address?)
  pub event Deposit(id: UInt64, to: Address?)

  pub resource NFT: NonFungibleToken.INFT {

    pub let id: UInt64

    pub let name: String
    pub let favouriteFood: String
    pub let luckyNumber: Int

    init(_name: String, _favouriteFood: String, _luckyNumber: Int) {
      self.id = self.uuid

      self.name = _name
      self.favouriteFood = _favouriteFood
      self.luckyNumber = _luckyNumber
    }
  }

  pub resource Collection: NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic {
  
    pub var ownedNFTs: @{UInt64: NonFungibleToken.NFT}

    pub fun withdraw(withdrawID: UInt64): @NonFungibleToken.NFT {
      let nft <- self.ownedNFTs.remove(key: withdrawID) 
            ?? panic("This NFT does not exist in this Collection.")
      emit Withdraw(id: nft.id, from: self.owner?.address)
      return <- nft
    }

    pub fun deposit(token: @NonFungibleToken.NFT) {
      let nft <- token as! @NFT
      emit Deposit(id: nft.id, to: self.owner?.address)
      self.ownedNFTs[nft.id] <-! nft
    }

    pub fun getIDs(): [UInt64] {
      return self.ownedNFTs.keys
    }

    pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT {
      return (&self.ownedNFTs[id] as &NonFungibleToken.NFT?)!
    }

    // Borrow a reference to NFT's metadata using its ID
    pub fun borrowAuth(id: UInt64): &NFT {
      let ref = (&self.ownedNFTs[id] as auth &NonFungibleToken.NFT?)!
      return ref as! &NFT
    }

    init() {
      self.ownedNFTs <- {}
    }

    destroy() {
      destroy self.ownedNFTs
    }
  }

  pub fun createEmptyCollection(): @NonFungibleToken.Collection {
    return <- create Collection()
  }

  pub resource Minter {

    pub fun createNFT(name: String, favouriteFood: String, luckyNumber: Int): @NFT {
      return <- create NFT(_name: name, _favouriteFood: favouriteFood, _luckyNumber: luckyNumber)
    }

    pub fun createMinter(): @Minter {
      return <- create Minter()
    }

  }

  init() {
    self.totalSupply = 0
    emit ContractInitialized()
    log("CryptoPoops Deployed Successully")
    self.account.save(<- create Minter(), to: /storage/Minter)
  }
}
```
The provided code outlines a smart contract named CryptoPoops, inheriting functionalities from an NFT (Non-Fungible Token) contract located at address 0x05. It defines state variables such as totalSupply, events like ContractInitialized, Withdraw, and Deposit, along with resources NFT and Collection for managing Non-Fungible Tokens and collections. The contract includes functions for withdrawal, deposit, and borrowing NFTs and their metadata, along with initializers and a Minter resource for creating new NFTs. The contract's purpose revolves around managing NFTs and facilitating interactions within the blockchain ecosystem, providing mechanisms for minting, depositing, and withdrawing NFTs.

## Why We Use NFT Standard Contract 

the Flow Non-Fungible Token (NFT) standard, which consists of several components: the NonFungibleToken contract interface, the NFT resource, the Collection resource, and the Provider and Receiver resource interfaces. These components define rules, naming conventions, and behaviors for NFT contracts and collections, facilitating peer-to-peer transfers without centralized ledger interaction. By implementing these standards, users can create, manage, and exchange NFTs seamlessly across different contracts and collections. The interfaces ensure consistency and interoperability among NFT smart contracts, enabling straightforward token transfers through withdraw and deposit functions. Overall, the NFT standard enhances the efficiency and usability of NFT ecosystems by establishing common protocols and practices.

