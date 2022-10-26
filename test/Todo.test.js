const Todo = artifacts.require("Todo");
contract("Todo", (accounts) => {
  let todo;
  before(async () => {console.log("before each")
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
    console.log(todos[1].todo, typeof todos);
    assert.equal(todos.length, 2);
  });

  it("It should get update todo item given its id", async () => {
    let todos = await todo.getTodos.call();
    let addedTodo = await todo.updateTodos(todos.length - 1, "Dress up", true)
    todos = await todo.getTodos.call();
    assert.equal(todos[todos.length - 1].todo, 'Dress up');
  });
});
