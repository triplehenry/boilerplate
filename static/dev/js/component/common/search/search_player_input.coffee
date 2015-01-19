React = require 'react/addons'
{div, h3, input} = require '../../../service/dom.coffee'

SearchPlayerInput = React.createClass
    displayName: "SearchPlayerInput"

    render: ->
        div {className: 'search-player-input-com pull-left inline-block'},
            input {className: 'search-player-input'}


module.exports = SearchPlayerInput
