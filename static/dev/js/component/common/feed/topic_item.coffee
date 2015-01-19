React = require 'react/addons'
{input, div, button, li} = require '../../../service/dom.coffee'

TopicItem = React.createClass
    displayName: "TopicItem"
    propTypes:
        title: React.PropTypes.string.isRequired

    componentDidMount: ->

    _getData: ->
        @_topics = APP.topicCollection.toJSON()

    render: ->
        li {className: "topic-item-com"},
            @props.title




module.exports = TopicItem
