// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// entry 
// retrieve - user retrieve - any users can retrieve  
// nft-minting owner - dept- address : owner  & data - FIR = DataPerson + PoliceUserInfo 
// only owner? 
// array of criminals - only owner 
// criminal - how many cases and the data 
// check data person 

contract FIR{
    address public owner;
    //address of the person deploying the smart contract
    constructor() public{
        owner=msg.sender;
    }
    
    string[] public DataCriminal = ["Sai","Nilay","Zayan","Karthik","Samir"];
    
    struct dataPerson{
        string accusedName ; 
        string victimName ; 
        string date ; 
        string time ; 
        string incident ; 
        string witnessNames ; 
        string descriptionOfTheAccused ; 
        string policeName ; 
        string policeRank ; 
        string policeDepartment ; 
    }
    // FIR 
    
    // criminal count index => firData 
    mapping(uint256 => dataPerson) public fir ; 
    uint256 internal criminalCount = 0 ;
       
    // only owner functions 
    modifier onlyOwner {
      require(msg.sender == owner);
      _; } 

    // user can enter the function and return a flag if it has been accepted
    function entry(string memory _accusedName,  
        string memory _victimName, 
        string memory _date , 
        string memory _time, 
        string memory _incident, 
        string memory _witnessNames, 
        string memory _descriptionOfTheAccused,
        string memory _policeName ,
        string memory _policeRank ,
        string memory _policeDepartment) public onlyOwner{        
           fir[criminalCount] = dataPerson(_accusedName,_victimName,_date,_time,_incident,_witnessNames,_descriptionOfTheAccused, _policeName, _policeRank, _policeDepartment);
           ++criminalCount;
           DataCriminal.push(_accusedName); 
           }

    // 
    
    // retrieve 
    function retrieve(uint256 _entryno) public view returns(string memory _victimName, string memory _date, string memory _time, string memory _incident, string memory _witnessNames, string memory _descriptionOfTheAccused, string memory _policeName, string memory _policeRank, string memory _policeDepartment){    
        for(uint256 i=0; i<criminalCount ; i++)
        {
           if (keccak256(abi.encodePacked(fir[_entryno].accusedName))==keccak256(abi.encodePacked(fir[i].accusedName)))
           {
              return(fir[i].victimName, fir[i].date, fir[i].time, fir[i].incident, fir[i].witnessNames, fir[i].descriptionOfTheAccused, fir[i].policeName, fir[i].policeRank, fir[i].policeDepartment);
           }    
        }
    }

    // checks whether the person has any previous record 
    function checkDataPerson(uint _entryno) public view onlyOwner returns(bool flag) {
        for(uint i=0; i<DataCriminal.length; i++){
           flag = keccak256(abi.encodePacked(DataCriminal[i]))==keccak256(abi.encodePacked(fir[_entryno].accusedName));      
      }
    }



    // list of criminals  

    
}