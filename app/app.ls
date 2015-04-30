# module dependencies
require! <[ arch ]>

# route components
require! <[
  ./routes/todoapp
]>

initial-state =
  todo: ''
  todos: []

module.exports = arch.application.create do
  get-initial-state: ->
    initial-state

  start: (app-state) ->
    app-state.get \state.message .update -> 'I was updated!'

  routes: ->
    page = arch.routes.page

    arch.routes.define do
      page '*', todoapp
