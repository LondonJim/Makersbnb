$(document).ready(function() {
  var dates = []
  $(".availability").each(function() {
    $(this).on("click", function() {
      $(`#${this.id}`).css( "color", "purple")
      dates.includes(this.id) ? console.log("dates already added"): dates.push(this.id);
      console.log(dates);
    });
  });
});
