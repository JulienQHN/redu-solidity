// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.16;


contract Shippingtracking {

    /// L'Etat d'avancement du status (Pending = 0, Shipped = 1 et Delivered = 2)
  enum shippingStatus { Pending, Shipped, Delivered }
  
  /// Evenement déclancher quand le status à changer
    event statusChanger(address _by);
  /// La structure de mon tracking
  struct tracking {
    Shippingtracking.shippingStatus _ShippingStatus;
  }
    /// Le mapping des numéros tracké
    mapping(address => tracking) TrackingNumbers;
    
    /// La fonction qui me donne le shippingStatus en cours d'un tracking number
function getStatus(address _client) public view returns(shippingStatus) {
    return TrackingNumbers[_client]._ShippingStatus;
    
}

function Pending(address _client) public {
    tracking memory p = tracking(shippingStatus.Pending);
    TrackingNumbers[_client] = p;
    emit statusChanger(msg.sender);
}

function Shipped(address _client) public {
    tracking memory p = tracking(shippingStatus.Shipped);
    TrackingNumbers[_client] = p;
    emit statusChanger(msg.sender);
}

function Delivered(address _client) public {
    tracking memory p = tracking(shippingStatus.Delivered);
    TrackingNumbers[_client] = p;
    emit statusChanger(msg.sender);
}

function Tips(address payable _to) public payable {
   
    bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

} 