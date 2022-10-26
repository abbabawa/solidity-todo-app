// SPDX-License-Identifier: UNLICENSE-2.0

pragma solidity >=0.4.22 <0.9.0;

contract Todo {
    struct todoItem{
        uint id;
        string todo;
        bool done;
    }
    mapping(address=>todoItem[]) todos;

    function addTodo(string memory todo) public  {
        uint count = todos[msg.sender].length; 
        todos[msg.sender].push(todoItem({id: count, todo: todo, done: false}));
        
    }

    function getTodos() public view returns(todoItem[] memory){
        return todos[msg.sender];
    }

    function updateTodos(uint id, string memory todo, bool done) public {
        require(id < todos[msg.sender].length && id >= 0, 'The id provided is out of range');
        
        todoItem storage item = todos[msg.sender][id];
        // todos[msg.sender][id] = todoItem({id: id, todo: todo, done: done});
        item.done = done;
        item.todo = todo;
    }
}