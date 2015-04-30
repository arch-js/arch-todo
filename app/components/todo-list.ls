require! <[ arch classnames ]>

{map} = require 'prelude-ls'

d = arch.DOM

module.exports = class TodoList extends React.Component
  render: ->
    d.section class-name: 'main',
      d.input class-name: 'toggle-all', type: 'checkbox'
      d.label html-for: 'toggle-all', 'Mark all as complete'
      d.ul class-name: 'todo-list',
        @props.todos
        |> map ->
          done = it.get 'done'
          is-done = done.deref!
          d.li do
            class-name: classnames do
              completed: it.get 'done' .deref!
              editing: it.get 'editing' .deref!
            d.div class-name: 'view',
              d.input do
                class-name: 'toggle'
                type: 'checkbox'
                checked: is-done
                on-change: (e) ->
                  done.update -> !is-done
              d.label do
                it.get 'task' .deref!
              d.button class-name: 'destroy'
            d.input class-name: 'edit', default-value: 'edit'