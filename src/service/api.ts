import {UserProfile} from "./models";

export async function getAllProfiles(): Promise<Array<UserProfile>> {
    return []
}

export async function getProfileByAddress(blockchainAddress: string): Promise<UserProfile | null> {
    return null
}

export async function addNewProfile(profile: UserProfile) {

}

export async function removeProfile(blockchainAddress: string) {

}

export async function getAllAllowedAddresses(): Promise<Array<string>> {
    return []
}

export async function getAllowedByAddress(blockchainAddress: string): Promise<boolean> {
    return false
}

export async function addAllowedAddress(blockchainAddress: string) {

}

export async function removeAllowedAddress(blockchainAddress: string) {

}

