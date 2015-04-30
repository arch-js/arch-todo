require! <[ arch classnames ../lib/todos ]>

{map, zip, compact} = require 'prelude-ls'

d = arch.DOM

module.exports = class TodoList extends React.Component
  render: ->
    d.section class-name: 'main',
      d.input class-name: 'toggle-all', type: 'checkbox'
      d.label html-for: 'toggle-all', 'Mark all as complete'
      d.ul class-name: 'todo-list',
        @props.todos
        |> zip [0 til @props.todos.length]
        |> map ([idx, todo]) ~>
          done = todo.get 'done'
          return unless todos.state-match @props.mode, done.deref!

          editing = todo.get 'editing'
          task = todo.get 'task'

          d.li do
            class-name: classnames do
              completed: done.deref!
              editing: editing.deref!
            d.div class-name: 'view',
              d.input do
                class-name: 'toggle'
                type: 'checkbox'
                checked: done.deref!
                on-change: (e) ->
                  done.update -> !it
              d.label do
                task.deref!
              d.button do
                class-name: 'destroy'
                on-click: (e) ~>
                  @props.todos.update ->
                    todos = it.slice 0
                    todos.splice(idx, 1)
                    todos
            d.input class-name: 'edit', default-value: 'edit'
        |> compact
