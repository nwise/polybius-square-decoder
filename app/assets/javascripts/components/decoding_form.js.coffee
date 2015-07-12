@DecodingForm = React.createClass
  getInitialState: ->
      encoded: ''
      plain: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  valid: ->
    @state.encoded

  handleSubmit: (e) ->
    e.preventDefault()
    errorPane = $('div.alert')
    errorPane.hide()
    $.post( '', { decoding: @state }, (data) =>
      @props.handleNewDecoding data
      @setState @getInitialState()
    , 'JSON')
      .fail (data) ->
        errorPane.show()
        error_message = JSON.parse(data.responseText)
        errorPane.append(error_message.plain)

  render: ->
    React.DOM.form
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.textarea
          type: 'text'
          cols:100
          className: 'form-control'
          placeholder: 'Enter Text to Decode Here'
          name: 'encoded'
          value: @state.encoded
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Decode'
