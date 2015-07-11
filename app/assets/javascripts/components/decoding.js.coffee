@Decoding = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.decoding.encrypted
      React.DOM.td null, @props.decoding.plain
      React.DOM.td null, dateFormat(@props.decoding.created_at)
      React.DOM.td null, dateFormat(@props.decoding.updated_at)
