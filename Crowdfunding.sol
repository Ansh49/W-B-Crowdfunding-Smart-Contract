//SPDX-License-Identifier: MIT
    pragma solidity ^0.5.0;

contract CrowdSource{

    // Defining useful variables 
     address public manager;
     uint public MinimumContribution;
     uint public TotalContribution;
     uint public Target;
     uint public StartTime;
     address FundraiserAccount;
     // All the addresses are stored in an array named approvals
     address[] public approvals;
     // The total money will keep getting added 

     function Goal (uint target)public {
         // The person who calls this function (msg sender) is the manager
         manager = msg.sender;
         Target = target;
     }

     function Campaign(uint minimum)public {
         StartTime = block.timestamp;
         // The person who calls this function (msg sender) is the manager
        manager = msg.sender;
        MinimumContribution = minimum;
     }

       function Contribute() public payable{
        // Putting the condition that the contribution needs to be greater than the minimum contribution
       require(msg.value > MinimumContribution, "Please contribute more than minimum value");
       // Adding the address of the contributer (msg sender) in the approvals array
        approvals.push(msg.sender);
        // Putting the condition that the contribution can only be accepted if the total contribution has not reached the goal
        require (TotalContribution < Target, "The Fundrasing has been completed");
        // Adding the contribution by the user to the total fund pool
        TotalContribution += msg.value;
        msg.value[] ContributedFunds;
        msg.sender[] Contributer;

         if (block.timestamp >= 2 days) {
             //return all money back
            ContributedFunds[].transfer(Contributer[]);
         }
      }
        
    
        function FundsTransfer (address payable FundraiserAccount) public payable {
         // Transfer money to the admin specified address once fundrasing goal is met
        require (TotalContribution > Target, "The fundraising is still going on");
        FundraiserAccount.transfer(TotalContribution);
        }

        function AdminBalance() public view returns (uint) {
            return manager.balance;
        }
    
}





