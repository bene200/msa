LabelRowView = require "./LabelRowView"
pluginator = require("../../bone/pluginator")

module.exports = pluginator.extend

  initialize: (data) ->
    @g = data.g
    @draw()

  draw: ->
    @removeViews()
    for i in [0.. @model.length - 1] by 1
      continue if @model.at(i).get('hidden')
      view = new LabelRowView {model: @model.at(i), g: @g}
      view.ordering = i
      @addView "row_#{i}", view

  render: ->
    @renderSubviews()
    @el.className = "biojs_msa_labelblock"
    @el.style.display = "inline-block"
    @el.style.verticalAlign = "top"
    @