TopicCollection = require '../collection/topic_collection.coffee'
PageModel = require '../model/page_model.coffee'

module.exports =
    initListeners: (renderCallback) ->

        APP.pageModel ?= new PageModel()
        APP.topicCollection ?= new TopicCollection()

        # set up page model
        APP.pageModel.on 'all', (param) ->
            renderCallback()

        # set up topics collection
        APP.topicCollection.on 'add remove change', (param) ->
            renderCallback()



