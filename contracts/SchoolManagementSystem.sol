// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract SchoolManagementFactory {
    SchoolManagement public school ;

    function createContract() external  {
         school = new SchoolManagement();
    }
    
    function addStudent( string memory _name, uint8 _age)  external {
        school.addStudent(_name, _age);
    }
}

contract SchoolManagement {
   address public Principal;
   uint studentId;
   uint teacherId;

    // student Struct
    struct Student {
        string name;
        uint8 age;
        uint8 score;
    }
    // Teacher Struct
    struct Teacher {
        string name;
        uint8 age;
    }

    Student[] public studentArray;
    Teacher[] public teacherArray;


     mapping(uint => Teacher) public teachers;
     mapping(uint => Student) public students;

    modifier AddAccess {
        require(Principal == msg.sender, "You dont have access to perform this operation");
        _;
    }
    

    constructor() {
        Principal = msg.sender;
    }

    function addTeacher (string memory _name, uint8 _age) public  AddAccess  {
        uint _teacherId = teacherId + 1;
        teachers[_teacherId] = Teacher(_name, _age );
        teacherArray.push(teachers[_teacherId]);
        teacherId ++;
    }
    
    function addStudent ( string memory _name, uint8 _age) external  AddAccess{

        uint _studentId = studentId + 1;

        Student memory student;
        student.name = _name;
        student.age = _age;
        student.score = 0;

        students[_studentId] = student;
        studentArray.push(students[_studentId]);
        studentId++;
    }

    function createScore(uint _id, uint8 score) public AddAccess {
        Student storage student = students[_id];
        student.score = score;
    }

    function getStudent(uint _id) public  view  returns(Student memory){
        return students[_id];
    }
    function getAllStudent() public  view  returns(Student[] memory){
        return studentArray;
    }
}