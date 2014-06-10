'use strict'

define (requrie) ->
  $ = require 'jquery'
  ControlSignals = require 'model/control-signals'
  Rect = requrie 'geom/rect'

  class Intersection
    constructor: (@rect) ->
      @id = window.__nextId++
      @roads = []
      @inRoads = []
      @controlSignals = new ControlSignals

    @copy: (intersection) ->
      intersection.rect = Rect.copy intersection.rect
      result = Object.create Intersection::
      result = $.extend result, intersection
      result.roads = []
      result.inRoads = []
      result.controlSignals = new ControlSignals
      result

    toJSON: ->
      obj =
        id: @id
        rect: @rect

    update: ->
      road.update() for road in @roads
      road.update() for road in @inRoads