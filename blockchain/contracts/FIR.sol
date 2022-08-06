// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// entry 
// retrieve - user retrieve - any users can retrieve  
// nft-minting owner - dept- address : owner  & data - FIR = DataPerson + PoliceUserInfo 
// only owner? 
// array of criminals - only owner 
// criminal - how many cases and the data 



contract FIR{
    address public owner;
    //address of the person deploying the smart contract
    constructor() public{
        owner=msg.sender;
    }
    
    string[] public DataCriminal = ["Sai","Nilay","Zayan","Karthik","Samir"];
    
    struct DataPerson{
        string accusedName ; 
        string victimName ; 
        string date ; 
        string time ; 
        string incident ; 
        string witnessNames ; 
        string descriptionOfTheAccused ; 
    }
    struct PoliceUserInfo{
        string name ; 
        string rank ; 
        string department ; 
    }
    // FIR 
    struct firData{
        DataPerson data ; 
        PoliceUserInfo police  ; 
    } 
    
    // entry number => firData 
    mapping(uint256 => firData) public fir ; 

    


}