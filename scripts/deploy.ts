import { ethers } from "hardhat";

async function main() {

  const contractName = await ethers.deployContract("SchoolManagementFactory");

  await contractName.waitForDeployment();

  console.log(
    `SchoolManagement Contract deployed to ${contractName.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
