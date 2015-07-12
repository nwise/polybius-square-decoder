@Decoding = React.createClass

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/decodings/#{@props.decoding.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteDecoding @props.decoding

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.decoding.encoded
      React.DOM.td null, @props.decoding.plain
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
