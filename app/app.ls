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

  routes: ->
    page = arch.routes.page

    arch.routes.define do
      page '/:filter', todoapp
      page '*', todoapp
