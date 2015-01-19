React = require 'react'
Backbone = require 'backbone'
Backbone.$ = $
{div, h3, textarea} = require './service/dom.coffee'
config = require './service/config.coffee'
FeedPage = require './component/feed/feed_page.coffee'

window.APP = {}

Router = Backbone.Router.extend
    routes:
        "": "feed"
        "*notFound": "notFound"
    feed: ->
        FeedPage.start()
    notFound: ->
        console.log 'page not found'

APP.event = _.clone(Backbone.Events)

router = new Router()
pushState = if window.history?.pushState then true else false
Backbone.history.start
    pushState: pushState





