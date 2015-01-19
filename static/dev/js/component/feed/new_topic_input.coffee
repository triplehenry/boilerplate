React = require 'react/addons'
{input, div, button} = require '../../service/dom.coffee'

NewTopicInput = React.createClass
    displayName: "NewTopicInput"
    componentDidMount: ->

    _handleKeyDown: (e) ->
        if e.key is 'Enter'
            @_addNewTopic()

    _addNewTopic: ->
        $input = $(@refs.input.getDOMNode())
        text = $input.val()
        APP.topicCollection.addNewTopic
            title: text
        $input.val ''

    _clickPost: ->
        @_addNewTopic()

    render: ->
        div {className: "new-topic-input-com"},

            input
                className: "new-topic-input form-control"
                type: "text"
                onKeyDown: @_handleKeyDown
                ref: 'input'
            div {className: "btn btn-primary", onClick: @_clickPost}, "Post"



module.exports = NewTopicInput

