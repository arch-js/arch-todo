{filter} = require 'prelude-ls'

module.exports =
  active: (filter (.done is false))

  completed: filter (.done)
