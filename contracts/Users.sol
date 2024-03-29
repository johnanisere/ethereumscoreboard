pragma solidity >=0.4.21 <0.6.0;

contract Users {

    struct Participant {
        uint id;
        bytes32 name;
        uint point;
    }

    Participant[] public users;
    uint userCount;

    function addUser(bytes32 userName, uint userPoint) public returns (uint userID, bool success) {
        userID = userCount++;
        Participant memory newUser;
        newUser.id = userID;
        newUser.name = userName;
        newUser.point = userPoint;
        users.push(newUser);

        return(userID, true);
    }

    function getUsers() public view returns ( uint[] memory, bytes32[] memory, uint[] memory) {
        uint length = users.length;
        uint[] memory usersID = new uint[](length);
        bytes32[] memory userNames = new bytes32[](length);
        uint[] memory userPoints = new uint[](length);

        for (uint i = 0; i < users.length; i++) {
            Participant memory showUser;
            showUser = users[i];
            usersID[i] = showUser.id;
            userNames[i] = showUser.name;
            userPoints[i] = showUser.point;
        }

        return(usersID, userNames, userPoints);
    }

    function plusFive(uint id) public returns (bool success) {
        users[id].point = users[id].point + 5;
        return true;
    }

}