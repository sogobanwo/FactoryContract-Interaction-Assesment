import { ethers } from "hardhat";

async function main() {

    const SchoolManagementFactoryAddress = "0xDBBD011045F96992656FbC630a7EA859Ebe05969";

    const SchoolManagementContract = await ethers.getContractAt("ISchoolManagementFactory", SchoolManagementFactoryAddress);

  

    const createContractTx = await SchoolManagementContract.createContract();
    createContractTx.wait();
    
    const studentName = "Banwo Olorunsogo"
    const studentAge = 10

    const addStudentTx = await SchoolManagementContract.addStudent(studentName, studentAge)
    addStudentTx.wait();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});