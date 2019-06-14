$(function () {
  var link = $(".contRight_box a");
  var linkWid = $(".contRight_box a").width();
  for(var i = 0; i < link.length; i++) {
    link.eq(i).bind({
      mouseover:function () {
        var caseTextWid = $(this).find("p").outerWidth();
        var sum = caseTextWid - linkWid;
        $(this).find("p").css({
          "position":"absolute",
          "left":-sum + "px"
        });

      },
      mouseleave:function () {
        $(this).find("p").css({
          "left":"0",
          "position":"relative"

        })
      }
    })
  }

});
