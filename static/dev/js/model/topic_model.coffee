class TopicModel extends Backbone.Model
    defaults:
        title: ''
        cid: ''

    initialize: ->
        @set 'cid', @cid


module.exports = TopicModel
