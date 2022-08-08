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
        string memory _policeDepartment) public returns(bool flag){
            if (msg.sender == owner){
                dataPerson memory fir_data ;
                fir_data.accusedName = _accusedName ; 
                fir_data.victimName = _victimName ; 
                fir_data.date = _date ; 
                fir_data.time = _time ; 
                fir_data.incident = _incident ; 
                fir_data.witnessNames = _witnessNames ; 
                fir_data.descriptionOfTheAccused = _descriptionOfTheAccused ;
                fir_data.policeName = _policeName ;
                fir_data.policeRank = _policeRank ;  
                fir_data.policeDepartment = _policeDepartment ;    
                // adding the fir 
                fir[criminalCount] = fir_data ; 
                // adding the user 
                DataCriminal.push(_accusedName) ; 
                flag = true ; 
            }            
            else {
                flag = false ; 
            }
        }

    // 
    
    // retrieve 
    function retrieve(string memory _accusedName) public {

    }

    // checks whether the person has any previous record 
    function checkDataPerson(uint _entryno) public view onlyOwner returns(bool) {
        for(uint i=0; i<DataCriminal.length; i++){
           return keccak256(abi.encodePacked(DataCriminal[i]))==keccak256(abi.encodePacked(fir[_entryno].accusedName));      
      }
    }



    // list of criminals  

    
}