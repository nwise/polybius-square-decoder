@DecodingForm = React.createClass
  getInitialState: ->
      encrypted: ''
      plain: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  valid: ->
    @state.encrypted

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
          placeholder: 'Enter String to Decode Here'
          name: 'encrypted'
          value: @state.encrypted
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Decode'
