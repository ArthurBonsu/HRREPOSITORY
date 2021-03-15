pragma solidity >=0.7.0 <0.8.0;


contract MediationNegotiation  {
// `TokenCreator` is a contract type that is defined below.
// It is fine to reference it as long as it is not used
// to create a new contract.





uint i=0;
bool rebidallow = false;
bool bidallow = false;



//This is the Processing Entitiy , whether farmer, manufacturer or sales
    
struct MediationStructure{
    address mediationid;
    string mediationname;
    uint  mediationphase;
    uint mediationparticipantcount;
    uint   mediationcount;
    address payable participantaddress;
    string participantname;
    uint offermade;
    uint previousoffer;
    
    mapping (address => MediationStructure[1000]) mediationstructureaddressedmap;  
   mapping (string => MediationStructure[1000]) mediationstructurestringmap;  
}


MediationStructure public mediationstructurenode;
MediationStructure[1000] public mediationstructurestore;

event mediationBidEvent (address mediationid, string  mediationname, uint mediationphase,  uint  mediationparticipantcount, uint mediationcount,address payable participantaddress, string participantname,uint offermade);

function MediationBid (address mediationid, string memory mediationname, uint mediationphase,  uint  mediationparticipantcount, uint mediationcount,address payable participantaddress, string memory participantname,uint offermade)  internal {
       uint i = 0;
           bidallow = true;
           if(bidallow == true){
               
     
               
     mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationid =mediationid;
     mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationname = mediationname;
     mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationparticipantcount =mediationparticipantcount;
     mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationcount = i;
     mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].participantaddress =participantaddress;
     mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].participantname = participantname;
     mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].offermade =offermade;
// NO PREVIOUS OFFER IN THIS WORK HERE


emit mediationBidEvent( mediationid, mediationname, mediationphase,  mediationparticipantcount,  mediationcount,  participantaddress,  participantname, offermade);


 
 mediationstructurestore.push(MediationStructure(
     {
                   
   mediationid:  mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationid,
   mediationname:  mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationname,
   mediationparticipantcount:  mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationparticipantcount,
   mediationcount:  mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].mediationcount,
    participantaddress: mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].participantaddress,
    participantname: mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].participantname,
   offermade:  mediationstructurenode.mediationstructureaddressedmap[participantaddress][i].offermade
  
   
                           
 })); 
 
 


               
           }




     i++;
         
  
  
} 
     
     


}
