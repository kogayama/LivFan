$(function(){
  $fileField = $('#user_image')

  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $(".FormField__image");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          class: "preview avatar_large",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});