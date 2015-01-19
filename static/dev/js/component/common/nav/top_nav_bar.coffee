React = require 'react/addons'
SearchPlayerInput = require '../search/search_player_input.coffee'
{div, h3, textarea} = require '../../../service/dom.coffee'
Constants = require '../../../service/constants.coffee'
Events = Constants.events

TopNavBar = React.createClass
    displayName: "TopNavBar"

    componentDidMount: ->
        APP.event.on Events.ADDED_NEW_TOPIC, @_handleNewTopic

    componentWillUnmount: ->
        APP.event.off()

    _handleNewTopic: ->
        $logo = $(@refs.logo.getDOMNode())
        $logo.toggleClass('red')


    render: ->
        cx = React.addons.classSet
        classes = cx
            'top-nav-com': true
            'btn': true

        div {className: 'top-nav-bar-com'},
            div {className: 'app-name inline-block pull-left', ref: 'logo'}, "APP Name"
            div {className: 'vertical-divider inline-block pull-left'}
            SearchPlayerInput()




module.exports = TopNavBar
