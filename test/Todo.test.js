const Todo = artifacts.require("Todo");
contract('Todo', (accounts) => {
    let todo
    before(async () => {
        todo = await Todo.deployed()
    
      })
    
      it('It should add a todo item', async () => {
        const addedTodo = await todo.addTodo("Take my bathe") 
        assert.equal(addedTodo, 1)
      })

    //   it('It should set hero to Iron Man',async()=>{
    //       await hero.setHero("Iron Man",{from:accounts[0]})
    //       const receivedHero = await hero.getHero()
    //       assert.equal(receivedHero,"Iron Man")
    //   })
      
});