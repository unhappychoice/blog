$ ->
  if $(document).width() < 768
    return

  if $.cookie('menu-bar') == 'true'
    $('#sidebar').css('width', '300px')
    $('#sidebar').css('transition', 'none')
    setTimeout(() ->
      $('#sidebar').css('transition', 'width 0.08s ease-in-out')
    , 600)
  else
    $('#sidebar').css('width', '0')

  $('.toggle-menu').on 'click', () ->
    if $('#sidebar').css('width') == '300px'
      $('#sidebar').css('width', '0')
      $.cookie('menu-bar', false, { path: '/' })
    else
      $('#sidebar').css('width', '300px')
      $.cookie('menu-bar', true, { path: '/' })
