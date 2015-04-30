require! <[ arch ../lib/todos ]>

{empty} = require 'prelude-ls'

d = arch.DOM

items-left = (list) ->
  num = todos.active list.deref! .length
  plural = if num isnt 1 then "s" else ""

  "#num item#plural left"

module.exports = class TodoHeader extends React.Component
  submit: (e) ~>
    e.prevent-default!
    todo = @props.todo.deref!
    @props.todo.update -> ''
    @props.todos.update ~>
      it ++ do
        task: todo
        done: false
        editing: false

  render: ->
    todo-list = @props.todos

    d.footer class-name: "footer",
      d.span class-name: "todo-count",
        d.strong items-left todo-list

      d.ul class-name: "filters",
        d.li d.a do
          class-name: "selected"
          href: "/"

          "All"

        d.li d.a do
          class-name: ""
          href: "/active"

          "Active"

        d.li d.a do
          class-name: ""
          href: "/completed"

          "Completed"

      # Hidden if no completed items are left
      unless empty (todos.completed todo-list.deref!)
        d.button do
          class-name: "clear-completed"
          on-click: (e) ->
            todo-list.update ->
              todos.active it # only keep active

          "Clear completed"
