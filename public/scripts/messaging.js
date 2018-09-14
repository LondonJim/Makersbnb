$(document).ready(function() {
  var dates = []
  $(".availability").each(function() {
    $(this).on("click", function() {
      $(`#${this.id}`).css( "color", "purple")
      dates.includes(this.id) ? console.log("dates already added"): dates.push(this.id);
      document.getElementById('selectedDates').value = dates;
      console.log(dates);
    });
  });
  // function setReturnDates () {
  //   document.getElementById('selectedDates').value = dates;
  // }
});
