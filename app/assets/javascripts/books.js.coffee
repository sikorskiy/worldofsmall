jQuery ->
  new BookImageCropper()

class BookImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 4/3
      setSelect: [0,0,800,600]
      minSize: [800,600]
      bgColor: 'white'
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_crop_x').val(coords.x)
    $('#user_crop_y').val(coords.y)
    $('#user_crop_w').val(coords.w)
    $('#user_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(200/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(150/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(200/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(150/coords.h * coords.y) + 'px'

