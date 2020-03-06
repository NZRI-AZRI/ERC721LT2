//see https://github.com/Kaz-Naz

//https://github.com/0xcert/ethereum-erc721
//rinkeby 0xfE126ba2c2d5E6fB3a00fB96DFEa9Eef0c81df10
//by K.N

pragma solidity 0.6.2;

import "./nf-token.sol";
import "./nf-token-metadata.sol";
import "./nf-token-enumerable.sol";
import "../ownership/ownable.sol";

/**
 * 
 * 
 * @dev This is an example contract implementation of NFToken with metadata extension.
 */
contract MyERC721LT is
  NFTokenMetadata,
  Ownable
{

  /**
   * @dev Contract constructor. Sets metadata extension `name` and `symbol`.
   */
  constructor()
    public
  {
    nftName = "ERC721LimitedTransfer(version2 WE CAN NOT TRANSFER NFT)";
    nftSymbol = "ERC721LT2";
  }
    //Creator data
    string private _creatorData = "NZRI_Kaz-Naz_https://github.com/Kaz-Naz";
    function getCreatorData() public view onlyOwner returns (string memory) {
        return _creatorData; 
    }
    
    
    /*
    //This section enables transfer and approve function 
    //In japan , this section disabled. (if we want to use erc721LT as ticket.)
    
    function setTransferPermission(bool _newState) 
        external
        onlyOwner
    {
        _setTransferPermission(_newState);
    }
    */
    
    
    

   /**
   * @dev Removes a NFT from owner.
   * @param _tokenId Which NFT we want to remove.(burn)
   */
  function burn(
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._burn(_tokenId);
  }
  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   */
  function mint(
    address _to,
    uint256 _tokenId,
    string calldata _uri
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }

  /**
   * @dev write data NFT URI2.
   * @param _tokenId of the NFT .
   * @param _uri String representing RFC 3986 URI.
   */   
  function writeTokenUri2(
    uint256 _tokenId,
    string calldata _uri
  )
    external
    onlyOwner
    validNFToken(_tokenId)
  {
    idToUri2[_tokenId] = _uri;
  }
    
}










































