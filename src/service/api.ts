import {UserProfile} from "./models";
import {methods} from "./methods";

async function getAdminAddress(): Promise<string> {
    return await methods.getAdminAddress().call()
}

async function getAllProfiles(): Promise<Array<UserProfile>> {
    const result = await methods.getAllProfiles().call()
    console.log(result)
    return []
}

async function getProfileByAddress(blockchainAddress: string): Promise<UserProfile | null> {
    methods.getProfileByAddress(blockchainAddress).call()
    return null
}

async function addNewProfile(profile: UserProfile) {
    return await methods.addNewProfile(
        profile.firstName,
        profile.lastName,
        profile.nickname,
        profile.email,
        profile.blockchainAddress,
    ).call()
}

async function removeProfile(blockchainAddress: string) {
    return await methods.removeProfile(
        blockchainAddress
    ).call()
}

async function getAllAllowedAddresses(): Promise<Array<string>> {
    const result = await methods.getAllAllowedAddresses().call()
    console.log(result)
    return []
}

async function getAllowedByAddress(blockchainAddress: string): Promise<boolean> {
    const result = await methods.getAllowedByAddress(blockchainAddress).call()
    console.log(result)
    return false
}

async function addAllowedAddress(blockchainAddress: string) {
    return await methods.addAllowedAddress(
        blockchainAddress
    ).call()
}

async function removeAllowedAddress(blockchainAddress: string) {
    return await methods.removeAllowedAddress(
        blockchainAddress
    ).call()
}

export const api = {
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

