# on document ready
$ ->

  defineColors = (text) ->
    # define groups of letters
    groupA = ["a","e","i","o","u"]
    groupB = ["p", "t", "k", "s", "c", "h", "f"]
    groupC = ["b","d","g","h","j","l","m","n","r","v","z"]
    
    # break text string by character
    chars = text.split('')
    console.log(chars)
    
    # count how many matches for each group
    
    # group A manipulates h
    # group B manipulates s
    # group C manipulates v
  map = (x, in_min, in_max, out_min, out_max) ->
    (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
  
  showEditor = ->
      $('body').css('background-color',colorTodayHEX)
      $('textarea').css('color', 'rgb( '+colorTodayComplementaryRGB+')')
      
      $('div#queue').hide();
      $('div#character-count').show()
  
      $('button#editor').hide()
      $('h1').hide()
      
      $('button#submit').show()
      $('textarea').show().focus()
  
  hideEditor = ->
      $('body').css('background-color',colorOrigHEX)
  
      $('div#queue').show();
      $('div#character-count').hide()
  
      $('button#submit').hide()
      $('textarea').hide()
      
      $('button#editor').show()
      $('h1').show()
  
  colorTodayRGB = [
    Math.round( map( parseInt( moment().format('DD') ), 1, 31, 0, 255 ) ),
    Math.round( map( parseInt( moment().format('MM') ), 1, 12, 0, 255 ) ), 
    Math.round( map( parseInt( moment().format('YYYY') ), 1970, 2038, 0, 255 ) )
  ]
  
  colorTodayHEX = $c.rgb2hex( 
    colorTodayRGB[0],
    colorTodayRGB[1],
    colorTodayRGB[2]
  )
  colorTodayHSV = $c.hex2hsv( colorTodayHEX ).a
  colorTodayComplementaryRGB = $c.complement( 
    colorTodayRGB[0],
    colorTodayRGB[1],
    colorTodayRGB[2]
  ).a;
  
  colorOrigRGB = $('body').css('background-color').split("(")[1].split(")")[0].split(",")
  colorOrigHEX = $c.rgb2hex(
    parseInt( colorOrigRGB[0].replace(/\s+/g, '') ),
    parseInt( colorOrigRGB[1].replace(/\s+/g, '') ),
    parseInt( colorOrigRGB[2].replace(/\s+/g, '') )
  )
  colorOrigHSV = $c.hex2hsv( colorOrigHEX ).a

  console.log colorTodayRGB

  $('h1').fitText(1.65, { minFontSize: '12px', maxFontSize: '96px' });
  $('textarea').fitText(1.65, { minFontSize: '12px', maxFontSize: '96px' });
  
  $('textarea').autosize()
  
  $('button#editor').on 'click touchstart', ->
    showEditor()
        
#   $('textarea').blur ->
#     hideEditor()
    
  $('textarea').keyup (e) ->
    entered = $('textarea').val()
    $('div#character-count b').html(140-entered.length)
  
    defineColors(entered)
    
  $('button#submit').on 'click touchstart', (e) ->
  
    e.preventDefault()
  
    $.post
      url: 'send.php'
      data: $('textarea').val()
      success: (data) ->
      
        alert("success")
        #alert(data)
        #$('body').append('<div>Great! Your message will be displayed in #{data} days.</div>')
    
  $(document).keyup (e) ->
    # if esc pressed
    if e.keyCode == 27
      hideEditor()