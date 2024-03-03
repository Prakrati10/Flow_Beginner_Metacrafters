import NonFungibleToken from 0x05
import CryptoPoops from 0x05

pub fun main(acctAddress: Address, id: UInt64): &NonFungibleToken.NFT {


    let contract = getAccount(acctAddress).getCapability(/public/CryptoPoopsCollection)
      .borrow<&CryptoPoops.Collection>() ?? panic("Could not borrow collection reference")

    
  let nftData = contract.borrowAuth(id: id)
  
  return nftData
}
