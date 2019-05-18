pragma solidity ^0.5.0;

contract Adoption {

    address[16] public adopters;
    address public owner;

    struct auth{
        address addr;
    }

    auth[] auths;
    constructor() public {
        owner = msg.sender;
    }

    function authorize() public {
        bool token = true;
        for (uint i = 0; i < auths.length; i++){
            if(auths[i].addr == msg.sender){
                token = false;
                break;
            }
        }
        require(token);
        auths.length++;
        auths[auths.length - 1].addr = msg.sender; 
    }

    function adopt(uint petId) public returns (uint) {
        require(petId <= 15);
        bool token = false;
        for (uint i = 0; i < auths.length; i++){
            if(auths[i].addr == msg.sender){
                token = true;
                break;
            }
        }
        require(token);
        
        adopters[petId] = msg.sender;
        return petId;
    }

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }

}