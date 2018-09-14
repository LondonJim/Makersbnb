$(document).ready(function() {
  $(".availability").each(function() {
    $(this).on("click", function() {
      console.log(this.id);
    });
  });
});
