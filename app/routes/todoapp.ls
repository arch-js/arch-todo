require! {
  './base-route': BaseRoute
  arch
}

layout = arch.dom require '../components/layout'
todo-header = arch.dom require '../components/todo-header'
todo-list = arch.dom require '../components/todo-list'
todo-controls = arch.dom require '../components/todo-controls'

d = arch.DOM

module.exports = class TodoRoute extends BaseRoute
  get-title: -> super "Welcome!"

  render: ->
    todo = @props.app-state.get 'state.todo'
    todos = @props.app-state.get 'state.todos'

    layout do
      d.section class-name: 'todoapp',
        todo-header do
          todo: todo
          todos: todos
        if todos.length > 0
          todo-list todos: todos
        todo-controls todos: todos

      d.footer class-name: 'info',
        d.p 'Double click to edit a todo'
        d.p do
          'Created by '
          d.a do
            href: 'https://github.com/tabazevedo'
            'Tiago Azevedo'
          d.span " & "
          d.a do
            href: 'https://github.com/charypar'
            'Viktor Charypar'
        d.p do
          'Part of '
          d.a do
            href: 'https://github.com/redbadger/arch'
            'Arch'
