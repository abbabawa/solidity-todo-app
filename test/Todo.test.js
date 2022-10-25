const Todo = artifacts.require("Todo");
contract('Todo', (accounts) => {
    let todo
    before(async () => {
        todo = await Todo.deployed()
    
      })
    
      it('It should add a todo item', async () => {
        const addedTodo = await todo.addTodo("Take my bathe") 
        let todos = await todo.getTodos.call();console.log(todos, typeof todos);
        assert.equal(todos.length, 1)
      })

      it('It should get a users todos',async()=>{
        let todos = await todo.getTodos.call();
        assert.equal(todos.length, 1)

        const addedTodo = await todo.addTodo("brush my teeth") 
        todos = await todo.getTodos.call();console.log(todos, typeof todos);
        assert.equal(todos.length, 2)
      })
      
});