pragma solidity ^0.8.5;

contract UserProfileService {

    struct UserProfile {
        string firstName;
        string lastName;
        string nickname;
        string email;

        address profileAddress;
    }

    address private admin;

    UserProfile[] private profiles;
    mapping(address => UserProfile) private addressToProfile;

    address[] private allowedAddresses;
    mapping(address => bool) private allowedAddressToValue;

    constructor() public {
        admin = msg.sender;
    }

    function getAdminAddress() external view returns (address) {
        return admin;
    }

    function getAllProfiles() external view returns (UserProfile[] memory) {
        return profiles;
    }

    function getProfileByAddress(address target) external view returns (UserProfile memory) {
        return addressToProfile[target];
    }

    function addNewProfile(
        string memory _firstName,
        string memory _lastName,
        string memory _nickname,
        string memory _email,
        address _profileAddress
    ) external {
        require(_checkSenderIsAllowed(msg.sender), "Only allowed user can add new profile");

        if (_checkUserHasProfile(_profileAddress)) {
            return;
        }

        UserProfile memory profile = UserProfile(
            _firstName,
            _lastName,
            _nickname,
            _email,
            _profileAddress
        );

        profiles.push(profile);
        addressToProfile[_profileAddress] = profile;
    }

    function removeProfile(address _profileAddress) external {
        require(_checkSenderIsAllowed(msg.sender), "Only allowed user can remove profile");

        delete addressToProfile[_profileAddress];
        UserProfile[] memory newProfiles = _removeAddressFromArray(profiles, _profileAddress);

        while (profiles.length != 0) {
            profiles.pop();
        }

        for (uint i = 0; i < newProfiles.length; i++) {
            profiles.push(newProfiles[i]);
        }
    }

    function getAllAllowedAddresses() external view returns (address[] memory) {
        return allowedAddresses;
    }

    function getAllowedByAddress(address target) external view returns (bool) {
        return allowedAddressToValue[target];
    }

    function addAllowedAddress(address _allowedAddress) external {
        require(_checkSenderIsAdmin(msg.sender), "Only admin can add allowed address");

        if (_checkSenderIsAllowed(_allowedAddress)) {
            return;
        }

        allowedAddresses.push(_allowedAddress);
        allowedAddressToValue[_allowedAddress] = true;
    }

    function removeAllowedAddress(address _allowedAddress) external {
        require(_checkSenderIsAdmin(msg.sender), "Only admin can remove allowed address");

        allowedAddressToValue[_allowedAddress] = false;
        allowedAddresses = _removeAddressFromArray(allowedAddresses, _allowedAddress);
    }

    function _checkSenderIsAllowed(address sender) private view returns (bool) {
        return allowedAddressToValue[sender] == true;
    }

    function _checkSenderIsAdmin(address sender) private view returns (bool) {
        return sender == admin;
    }

    function _checkUserHasProfile(address userAddress) private view returns (bool) {
        for (uint i = 0; i < profiles.length; i++) {
            if (profiles[i].profileAddress == userAddress) {
                return true;
            }
        }
        return false;
    }

    function _removeAddressFromArray(
        address[] memory array,
        address target
    ) private pure returns (address[] memory) {
        bool arrayContainsTarget = false;
        for (uint i = 0; i < array.length; i++) {
            if (array[i] == target) {
                arrayContainsTarget = true;
                break;
            }
        }

        if (!arrayContainsTarget) {
            return array;
        }

        address[] memory result = new address[](array.length - 1);

        uint currentOffset = 0;
        for (uint i = 0; i < array.length; i++) {
            if (array[i] == target) {
                currentOffset = 1;
                continue;
            }
            result[i - currentOffset] = array[i];
        }

        return result;
    }

    function _removeAddressFromArray(
        UserProfile[] memory array,
        address target
    ) private pure returns (UserProfile[] memory) {
        bool arrayContainsTarget = false;
        uint length = array.length;
        for (uint i = 0; i < length; i++) {
            if (array[i].profileAddress == target) {
                arrayContainsTarget = true;
                break;
            }
        }

        if (!arrayContainsTarget) {
            return array;
        }

        UserProfile[] memory result = new UserProfile[](length - 1);

        uint currentOffset = 0;
        for (uint i = 0; i < length; i++) {
            if (array[i].profileAddress == target) {
                currentOffset = 1;
                continue;
            }
            result[i - currentOffset] = array[i];
        }

        return result;
    }
}
