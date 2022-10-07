import {ethers} from "ethers";
// @ts-ignore
import contract from "./../artifacts/contracts/FerumBotToken.sol/FerumBotToken.json";
const { API_KEY, NETWORK, PRIVATE_KEY, CONTRACT_ADDRESS } = process.env;

const alchemyProvider = new ethers.providers.AlchemyProvider(NETWORK, API_KEY);
// @ts-ignore
const signer = new ethers.Wallet(PRIVATE_KEY, alchemyProvider)
// @ts-ignore
const tokenContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer)

async function getBalance() {
    const result = await tokenContract["helloWorld"]()
    console.log(result)
}

getBalance().then().catch((err) => console.error(err))