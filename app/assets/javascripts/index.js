$(document).ready(function() {
  $('#btn_recommend').click(function() {
    data_request = {
      'alcohol_level': $("#alcohol_level").val(),
      'distilled': $("#distilled").val(),
      'base_ingredient':  $("#base_ingredients").val(),
      'origin': $("#origin").val()
    }

    $.ajax({
      url: "/api/drinks_recommend",
      data: data_request,
      method: "GET",
      dataType: "json"
    }).done(function(data) {
      console.log(data['data'])
      $('.drink-card').remove();
      data['data'].map((drink)=> {
        template = `
          <div class='card drink-card'>
            <img class='drink-card__img' src='${drink.image_url}'>
            <div class='drink-card__body'>
              <h2>${drink.name}</h2>
              <p>${drink.description}</p>
            </div>
          </div>
        `
        $('.drinks-list').append(template);
       });
    })
  });
});
