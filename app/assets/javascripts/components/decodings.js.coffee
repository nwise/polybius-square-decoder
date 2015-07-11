@Decodings = React.createClass
  getInitialState: ->
    decodings: @props.data

  getDefaultProps: ->
    decodings: []

  addDecoding: (decoding) ->
    decodings = @state.decodings.slice()
    decodings.push decoding
    @setState decodings: decodings

  render: ->
      React.DOM.div
        className: 'decodings'
        React.DOM.h2
          className: 'title'
          'Decodings'
          React.createElement DecodingForm, handleNewDecoding: @addDecoding
          React.DOM.hr null
          React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th null, "English"
                React.DOM.th null, "Encrypted"
                React.DOM.th null, "Created At"
                React.DOM.th null, "Updated At"
            React.DOM.tbody null,
              for decoding in @state.decodings
                React.createElement Decoding , key: decoding.id, decoding: decoding
