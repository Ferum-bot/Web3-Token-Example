pragma abicoderv2;
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

    constructor() {
        admin = msg.sender;
    }

    function getAllProfiles() external view returns (UserProfile[] memory) {
        return profiles;
    }

    function getProfileByAddress(address target) external view returns (UserProfile memory) {
        return addressToProfile[target];
    }

    function addNewProfile(
        string _firstName,
        string _lastName,
        string _nickname,
        string _email,
        address _profileAddress
    ) external {
        require(_checkSenderIsAllowed(msg.sender));

        UserProfile profile = UserProfile(
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
        require(_checkSenderIsAllowed(msg.sender));

        delete addressToProfile[_profileAddress];
        profiles = _removeAddressFromArray(profiles, _profileAddress);
    }

    function getAllAllowedAddresses() external view returns (address[] memory) {
        return allowedAddresses;
    }

    function getAllowedByAddress(address target) external view returns (bool memory) {
        return allowedAddressToValue[target];
    }

    function addAllowedAddress(address _allowedAddress) external {
        require(_checkSenderIsAdmin(msg.sender));

        allowedAddresses.push(_allowedAddress);
        allowedAddressToValue[_allowedAddress] = true;
    }

    function removeAllowedAddress(address _allowedAddress) external {
        require(_checkSenderIsAdmin(msg.sender));

        allowedAddressToValue[_allowedAddress] = false;
        allowedAddresses = _removeAddressFromArray(allowedAddresses, _allowedAddress);
    }

    function _checkSenderIsAllowed(address sender) private view returns (bool memory) {
        return allowedAddressToValue[sender] == true;
    }

    function _checkSenderIsAdmin(address sender) private view returns (bool memory) {
        return sender == admin;
    }

    function _removeAddressFromArray(
        address[] array,
        address target
    ) private pure returns (address[] memory) {
        address[] memory result;

        for (uint i = 0; i < array.length; i++) {
            if (array[i] == target) {
                continue;
            }
            result.push(array[i]);
        }

        return result;
    }

    function _removeAddressFromArray(
        UserProfile[] array,
        address target
    ) private pure returns (UserProfile[] memory) {
        UserProfile[] memory result;

        for (uint i = 0; i < array.length; i++) {
            if (array[i].profileAddress == target) {
                continue;
            }
            result.push(array[i]);
        }

        return result;
    }
}
