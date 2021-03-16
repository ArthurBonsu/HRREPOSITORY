pragma solidity >=0.7.0 <0.8.0;




contract MediationNegotiation  {
// `TokenCreator` is a contract type that is defined below.
// It is fine to reference it as long as it is not used
// to create a new contract.


uint i=0;
bool rebidallow = false;
bool bidallow = false;
bool accept = false;



//This is the Processing Entitiy , whether farmer, manufacturer or sales
    
struct MediationStructureIntelligent{
    address mediationid;
    string mediationname;
    uint  mediationphase;
    uint mediationparticipantcount;
    uint   mediationcount;
    address payable participantaddress;
    string participantname;
    uint offermade;
    uint previousoffer;
    
    mapping (address => MediationStructureIntelligent[1000]) mediationstructureaddressedmap;  
   mapping (string => MediationStructureIntelligent[1000]) mediationstructurestringmap;  
}



MediationStructureIntelligent[] public mediationstructurestore;
MediationStructureIntelligent  mediationstructurenode;

event mediationBidEvent (address mediationid,address payable partaddress,string  participantname,uint offermade);

function MediationBid (address mediationid,address payable partaddress,string memory participantname, uint offermade)  public returns ( address _mediationid, address payable _partaddress, string memory _participantname,uint _offermade) {
         accept = true;
           require(bidallow == true, "Bid has been allowed");
           
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].mediationid =mediationid;
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].participantaddress =partaddress;
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].participantname = participantname;
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].offermade =offermade;
      



     i++;
   emit mediationBidEvent(mediationid,partaddress,participantname, offermade);  
     
         return ( mediationid,partaddress, participantname, offermade);
  
  

     
}

event  RemediationBidEvent(address mediationid,address payable partaddress,string participantname, uint offermade, uint previousoffer);


function RemediationBid (address mediationid,address payable partaddress,string memory participantname, uint offermade, uint previousoffer)  public returns ( address _mediationid, address payable _partaddress, string memory _participantname,uint _offermade, uint _prevoffer) {
         accept = true;
           require(bidallow == true, "Bid has been allowed");
           
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].mediationid =mediationid;
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].participantaddress =partaddress;
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].participantname = participantname;
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].offermade =offermade;
     mediationstructurenode.mediationstructureaddressedmap[partaddress][i].previousoffer =previousoffer; 



     i++;
   emit RemediationBidEvent(mediationid,partaddress,participantname, offermade, _prevoffer);  
     
         return ( mediationid,partaddress, participantname, offermade, _prevoffer);
  
  

     
}


function reviewprocess(address emediationid, address payable eparticipantaddress, string memory eparticipantname, bool edecision, string memory ereviewstatus)public returns (address _emediationid, address payable _eparticipantaddress, string memory _eparticipantname, bool _edecision, string memory _ereviewstatus){
        
        if(edecision == true){
        accept = true;
        _ereviewstatus = 'Review accepted!';
        }
        else{
         _ereviewstatus = 'Review rejected!';    
        }
}
    
    

     
     
}
