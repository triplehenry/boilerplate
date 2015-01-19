React = require 'react/addons'
NewTopicInput = require '../feed/new_topic_input.coffee'
TopNavBar = require '../common/nav/top_nav_bar.coffee'
FeedList = require '../feed/feed_list.coffee'
TopicCollection = require '../../collection/topic_collection.coffee'
PageModel = require '../../model/page_model.coffee'
{div, span} = require '../../service/dom.coffee'
BackboneService = require '../../service/backbone.coffee'


FeedPage = React.createClass
    displayName: "FeedPage"
    componentDidMount: ->
        @_init()

    _init: ->
        # make api calls here

    render: ->
        div {className: 'feed-page-com'},
            TopNavBar()
            div {className: 'feed-wrap'},
                div {className: 'feed-side left'},
                    NewTopicInput()
                    div {className: 'feed-list-wrap'},
                        FeedList()
                div {className: 'feed-side right'}


_buildPage = ->
    React.render(FeedPage(), document.getElementById('page-view'))

module.exports =
    start: ->
        BackboneService.initListeners(_buildPage)
        _buildPage()
