$(document).on('ready turbolinks:load', function() {
  setVisibilityForType();
});

$(document).on("change", "input[name='cardio_report[activity_type]']", function() {
  setVisibilityForType();
});

function setVisibilityForType() {
  if ($("input[name='cardio_report[activity_type]']:checked").val() == "hike") {
    $("#duration-input").hide();
  } else {
    $("#duration-input").show();
  }
}