React = require 'react/addons'
{input, div, button, li} = require '../../service/dom.coffee'
ReactCSSTransitionGroup = React.addons.CSSTransitionGroup
TopicItem = require '../common/feed/topic_item.coffee'

FeedList = React.createClass
    displayName: "FeedList"
    componentDidMount: ->

    _getData: ->
        @_topics = APP.topicCollection.toJSON()


    render: ->
        @_getData()
        topics = @_topics.map (topic) =>
            TopicItem {className: 'topic-wrap', key: topic.cid, title: topic.title}

        div {className: "feed-list-com"},
            ReactCSSTransitionGroup
                component: "ul"
                transitionName: "example"
                children: {topics}




module.exports = FeedList
