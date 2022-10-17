import Web3 from "web3";

const { INFURA_API_URL } = process.env;

// @ts-ignore
export const web3 = new Web3(INFURA_API_URL)