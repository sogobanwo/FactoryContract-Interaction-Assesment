// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISchoolManagementFactory{
    function addStudent(string memory _name, uint8 _age) external;
    function createContract() external ;
}