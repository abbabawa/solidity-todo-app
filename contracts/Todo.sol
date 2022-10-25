// SPDX-License-Identifier: UNLICENSE-2.0

pragma solidity >=0.4.22 <0.9.0;

contract Todo {
    struct todoItem{
        uint id;
        string todo;
    }
    mapping(address=>todoItem[]) todos;

    function addTodo(string memory todo) public  {
        uint count = todos[msg.sender].length; 
        todos[msg.sender].push(todoItem({id: count, todo: todo}));
        
    }

    function getTodos() public view returns(todoItem[] memory){
        return todos[msg.sender];
    }
}