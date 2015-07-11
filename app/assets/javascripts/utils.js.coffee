@dateFormat = (date) ->
  date_obj = new Date(date)
  date_obj.toISOString().replace /\..+$/g, ''
