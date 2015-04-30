require! <[ arch ]>

d = arch.DOM

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
    todo = @props.todo.deref!
    d.header class-name: 'header',
      d.h1 'todos'
      d.form do
        on-submit: @submit
        d.input do
          class-name: 'new-todo',
          placeholder: 'What needs to be done?'
          autofocus: true
          value: todo
          on-change: (e) ~> @props.todo.update -> e.target.value