// SPDX-License-Identifier: UNLICENSE-2.0

pragma solidity >=0.4.22 <0.9.0;

contract Todo {
    struct categoriesStruct{
        uint id;
        string name;
    }
    struct todoItem{
        uint id;
        uint category;
        string todo;
        bool done;
    }
    mapping(address=>todoItem[]) todos;
    mapping(address=>categoriesStruct[]) categories; 

    function addCategory(string memory name) public {
        uint count = categories[msg.sender].length; 
        categories[msg.sender].push(categoriesStruct({id: count, name: name}));
    }

    function getCategories() public view returns(categoriesStruct[] memory){
        return categories[msg.sender];
    }

    function updateCategory(uint id, string memory name) public {
        uint count = categories[msg.sender].length; 
        categories[msg.sender].push(categoriesStruct({id: count, name: name}));

        require(id < categories[msg.sender].length && id >= 0, 'The id provided is out of range');
        
        categoriesStruct storage category = categories[msg.sender][id];
        category.name = name; 
    }

    function deleteCategory(uint id) public {
        require(id < categories[msg.sender].length && id >= 0, 'The id provided is out of range');

        for(uint i = id; i < categories[msg.sender].length - 1; i++) {
            categories[msg.sender][i] = categories[msg.sender][i+1];
        }
        categories[msg.sender].pop();
    }

    function addTodo(string memory todo, uint category) public  {
        uint count = todos[msg.sender].length; 
        todos[msg.sender].push(todoItem({id: count, todo: todo, done: false, category: category}));
        
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

    function deleteTodo(uint id) public {
        require(id < todos[msg.sender].length && id >= 0, 'The id provided is out of range');

        for(uint i = id; i < todos[msg.sender].length - 1; i++) {
            todos[msg.sender][i] = todos[msg.sender][i+1];
        }
        todos[msg.sender].pop();
    }

    function clearTodos() public { 
        delete todos[msg.sender];
    }
}