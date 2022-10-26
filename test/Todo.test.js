const Todo = artifacts.require("Todo");
contract("Todo", (accounts) => {
  let todo;
  before(async () => {
    todo = await Todo.deployed();
  });

  it("It should add a todo item", async () => {
    const addedTodo = await todo.addTodo("Take my bathe");
    let todos = await todo.getTodos.call();
    // console.log(todos, typeof todos);
    assert.equal(todos.length, 1);
  });

  it("It should get a users todos", async () => {
    let todos = await todo.getTodos.call();
    assert.equal(todos.length, 1);

    const addedTodo = await todo.addTodo("brush my teeth");
    todos = await todo.getTodos.call();
    
    assert.equal(todos.length, 2);
  });

  it("It should update a todo item given its id", async () => {
    let todos = await todo.getTodos.call();
    let updatedTodo = await todo.updateTodos(todos.length - 1, "Dress up", true)
    todos = await todo.getTodos.call();
    assert.equal(todos[todos.length - 1].todo, 'Dress up');
  });

  it("It should delete a todo item given its id", async () => {
    let deletedTodo = await todo.deleteTodo(0)
    let todos = await todo.getTodos.call();
    assert.equal(todos.length, 1);
  });

  it("It should clear all todos for a particular user", async () => {
    let cleared = await todo.clearTodos()
    let todos = await todo.getTodos.call();
    assert.equal(todos.length, 0);
  });
});
