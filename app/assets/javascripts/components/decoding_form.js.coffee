@DecodingForm = React.createClass
  getInitialState: ->
      encrypted: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  valid: ->
    @state.encrypted

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { decoding: @state }, (data) =>
      @props.handleNewDecoding data
      @setState @getInitialState()
      , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Enter String to Decrypt Here'
          name: 'encrypted'
          value: @state.encrypted
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Decode'
