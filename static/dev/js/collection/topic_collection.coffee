TopicModel = require '../model/topic_model.coffee'
Constants = require '../service/constants.coffee'
Events = Constants.events

class TopicCollection extends Backbone.Collection
    model: TopicModel
    initialize: ->

    addNewTopic: (data) ->
        topic = new TopicModel(data)
        @add topic, {at: 0}
        APP.event.trigger Events.ADDED_NEW_TOPIC

module.exports = TopicCollection
