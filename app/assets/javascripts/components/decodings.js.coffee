@Decodings = React.createClass
  getInitialState: ->
    decodings: @props.data

  getDefaultProps: ->
    decodings: []

  addDecoding: (decoding) ->
    decodings = @state.decodings.slice()
    decodings.push decoding
    @setState decodings: decodings

  deleteDecoding: (decoding) ->
    decodings = @state.decodings.slice()
    index = decodings.indexOf decoding
    decodings.splice index, 1
    @replaceState decodings: decodings

  render: ->
      React.DOM.div
        className: 'decodings'
        React.DOM.div
          className: 'alert alert-danger'
          style: {display: 'none'}
          role: 'alert'
        React.createElement DecodingForm, handleNewDecoding: @addDecoding
        React.DOM.hr null
        React.DOM.table
          className: 'table table-bordered table-striped'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, "English"
              React.DOM.th null, "Encoded"
              React.DOM.th
                className: 'col-md-2'
                "Action"
          React.DOM.tbody null,
            for decoding in @state.decodings
              React.createElement Decoding , key: decoding.id, decoding: decoding, handleDeleteDecoding: @deleteDecoding
