{filter} = require 'prelude-ls'

module.exports =
  active: (filter (.done is false))

  completed: filter (.done)

  state-match: (mode, done) -->
    return true unless mode in <[ active completed ]>

    modes = active: false, completed: true
    modes[mode] is done
