import { ethers } from "hardhat";

async function main() {

  const NFTMarket = await ethers.getContractFactory("NFTMarket");
  const nftMarket = await NFTMarket.deploy();

  await nftMarket.waitForDeployment();
  const marketAddress = await nftMarket.getAddress();

  console.log(`NFTMarket deployed to ${marketAddress}`);

  const NFTCollection = await ethers.getContractFactory("NFTCollection");
  const nftCollection = await NFTCollection.deploy(marketAddress);

  await nftCollection.waitForDeployment();
  const collectionAddress = await nftCollection.getAddress();

  console.log(`NFTCollection deployed to ${collectionAddress}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});