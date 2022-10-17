import {api} from "./api";

const GET_ALL_PROFILES_METHOD = 0
const GET_PROFILE_BY_ADDRESS = 1
const ADD_NEW_PROFILE = 2
const REMOVE_PROFILE = 3
const GET_ALL_ALLOWED_ADDRESSES = 4
const GET_ALLOWED_BY_ADDRESS = 5
const ADD_ALLOWED_ADDRESS = 6
const REMOVE_ALLOWED_ADDRESS = 7
const GET_ADMIN_ADDRESS = 8

async function invokeContractMethod(methodId: number) {
    switch (methodId) {
        case GET_ALL_PROFILES_METHOD: {
            await getAllProfiles()
            break
        }
        case GET_PROFILE_BY_ADDRESS: {
            await getProfileByAddress()
            break
        }
        case ADD_NEW_PROFILE: {
            await addNewProfile()
            break
        }
        case REMOVE_PROFILE: {
            await removeProfile()
            break
        }
        case GET_ALL_ALLOWED_ADDRESSES: {
            await getAllAllowed()
            break
        }
        case GET_ALLOWED_BY_ADDRESS: {
            await getProfileByAddress()
            break
        }
        case ADD_ALLOWED_ADDRESS: {
            await addAllowedAddress()
            break
        }
        case REMOVE_ALLOWED_ADDRESS: {
            await removeAllowedAddress()
            break
        }
        case GET_ADMIN_ADDRESS: {
            await getAdminAddress()
            break
        }
    }
}

const getAllProfiles = async () => {
    const result = await api.getAllProfiles()
    console.log(result)
}

const getProfileByAddress = async () => {
    const address = ''
    const profile = await api.getProfileByAddress(address)
    console.log(profile)
}

const addNewProfile = async () => {
    const profile = {
        firstName: 'Matvey',
        lastName: 'Popov',
        nickname: 'Ferum-bot',
        email: 'ghfdhuf85429532@gmail.com',
        blockchainAddress: '0x65010D833d0689a5453DC0ecE76E4c607c814332'
    }
    await api.addNewProfile(profile)
}

const removeProfile = async () => {
    const profileAddress = ''
    await api.removeProfile(profileAddress)
}

const getAllAllowed = async () => {
    const allowed = api.getAllAllowedAddresses()
    console.log(allowed)
}

const addAllowedAddress = async () => {
    const address = '0x65010D833d0689a5453DC0ecE76E4c607c814332'
    await api.addAllowedAddress(address)
}

const removeAllowedAddress = async () => {
    const address = ''
    await api.removeAllowedAddress(address)
}

const getAdminAddress = async () => {
    const address = await api.getAdminAddress()
    console.log(address)
}

invokeContractMethod(ADD_ALLOWED_ADDRESS).catch((err) => console.error(err))
