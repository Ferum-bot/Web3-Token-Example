// @ts-ignore
import contractJson from "../../artifacts/contracts/UserProfileService.sol/UserProfileService.json";
import {web3} from "./config";

const { SERVICE_CONTRACT_ADDRESS } = process.env;

// @ts-ignore
const contract = new web3.eth.Contract(contractJson.abi, SERVICE_CONTRACT_ADDRESS)

const getAdminAddress = () => {
    return contract.methods.getAdminAddress()
}

const getAllProfiles = () => {
    return contract.methods.getAllProfiles()
}
const getProfileByAddress = (...params: any[]) => {
    return contract.methods.getProfileByAddress(...params)
}
const addNewProfile = (...params: any[]) => {
    return contract.methods.addNewProfile(...params)
}
const removeProfile = (...params: any[]) => {
    return contract.methods.removeProfile(...params)
}
const getAllAllowedAddresses = () => {
    return contract.methods.getAllAllowedAddresses()
}
const getAllowedByAddress = (...params: any[]) => {
    return contract.methods.getAllowedByAddress(...params)
}
const addAllowedAddress = (...params: any[]) => {
    return contract.methods.addAllowedAddress(...params)
}
const removeAllowedAddress = (...params: any[]) => {
    return contract.methods.removeAllowedAddress(...params)
}

export const methods = {
    getAdminAddress,
    getAllProfiles,
    getProfileByAddress,
    addNewProfile,
    removeProfile,
    getAllAllowedAddresses,
    getAllowedByAddress,
    addAllowedAddress,
    removeAllowedAddress
}

