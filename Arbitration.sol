  
pragma solidity >=0.5.0 <0.6.0;


/**
 * @title IArbitrage
 * @dev IArbitrage contract
 *
 * @author Cyril Lapinte - <cyril.lapinte@openfiz.com>
 *
 * @notice Copyright © 2016 - 2019 Cyril Lapinte - All Rights Reserved
 * @notice This content cannot be used, copied or reproduced in part or in whole
 * @notice without the express and written permission of Cyril Lapinte.
 * @notice Written by *Cyril Lapinte, <cyril.lapinte@openfiz.com>
 * @notice All matters regarding the intellectual property of this code or software
 * @notice are subjects to Swiss Law without reference to its conflicts of law rules.
 *
 * Error messages
*/
contract ArbitrationContract{
    
         struct Arbitrant{
             address arbitrantaddress;
             uint256 arbitrantid;
         
      mapping (address => Arbitrant[1000]) arbitrantaddressset;
      mapping (bytes32 => Arbitrant[1000])  arbitrantbyteset;

       }
       
        Arbitrant[] public arbitrantstore; 
        Arbitrant arbitrantnode;
        
         struct Defendants{
             address arbitrantaddress;
             uint256 arbitrantid;
               mapping (address => Defendants[1000]) defendantaddressset;
      mapping (bytes32 => Defendants[1000]) defendantbytesset;

       }
       
        Defendants[] public defendantstore; 
        Defendants defendantnode;
        
        
        
         struct Claimant{
             address arbitrantaddress;
             uint256 arbitrantid;
                mapping (address => Claimant[1000]) claimantaddressset;
      mapping (bytes32 => Claimant[1000]) claimantbytesset;

       }
       
        Claimant[] public claimantstore; 
        Claimant claimantnode;
         
         struct Dispute{
             uint256  _disputeid;
             address arbitrantaddress;
             address defendantaddress;
             address claimantaddress;
               
               
                 mapping (address => Dispute[1000]) disputeaddressset;
      mapping (bytes32 => Dispute[1000]) disputebytesset;

       }
       
        Dispute[] public disputestore; 
        Dispute disputenode;
  
  
  function arbitrators(address _arbitrationaddress, uint256 _disputeid) public pure returns (address _arbitrationaddres, uint256 _arbitrationdisputeid){
                             
       arbitrantnode.arbitrantstore[_arbitrationaddress][_disputeid].arbitrantaddress = _arbitrationaddress;
         arbitrantnode.arbitrantstore[_arbitrationaddress][_disputeid].arbitrantid = arbitrantid;
       return ( _arbitrationaddress, _disputeid);
                                 
  }

  function disputeClaimant(address claimantaddress,  uint256 _disputeId) external view returns (address claimantaddress,  uint256 _disputeId){
                 claimantnode.claimantstore [_arbitrationaddress][_disputeid];                 
       
       
       return ();
      
  };
  function disputeArbitrable(uint256 _disputeId
    ) external view returns (address);
  function disputeDefendant(uint256 _disputeId
    ) external view returns (address);
  function disputeRaisedAt(uint256 _disputeId) external view returns (uint256);
  function disputeResolutionHash(uint256 _disputeId
    ) external view returns (bytes32){
        bytes32 disputehash  = keccak256(disputeId)
    };
  function disputeStatus(uint256 _disputeId
    ) external view returns (DisputeStatus);

  function disputesCount() external view returns (uint256);

  function raiseDispute(
    address _arbitrable,
    address _defendant,
    bytes32 _reasonHash,
    bytes32 _resolutionHash) external returns (uint256);
  function closeDispute(uint256 _disputeId) external;
  function suggestDisputeResolution(
    uint256 _disputeId, bytes32 _resolutionHash) external;
  function resolveDispute(
    uint256 _disputeId, bytes calldata _resolution) external;

  function addArbitrators(address[] calldata _arbitrators) external;
  function removeArbitrators(address[] calldata _arbitrators) external;
  function repudiate() external;

  event DisputeRaised(
    uint256 disputeId,
    address indexed arbitrable,
    address indexed claimant,
    address indexed defendant,
    bytes32 reasonHash);
  event DisputeClosed(uint256 disputeId, address indexed author);
  event DisputeResolutionSuggested(
    uint256 disputeId, address indexed author, bytes32 resolutionHash);
  event DisputeResolved(
    uint256 disputeId, address indexed author, bytes32 resolutionHash);

  event DisputeInterrupted(uint256 disputeId, address indexed author);
  event DisputeResumed(uint256 disputeId, address indexed author);

  event Repudiated(bytes reason);
}

}}
