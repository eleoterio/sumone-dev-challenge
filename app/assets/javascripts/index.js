$(document).ready(function() {
  $('.btn_request').click(function() {
    params =  set_parameters()
    request_api(params)
  });

  request_pages()
});

function set_parameters(page = 1) {
  switch ($('[name="searchRadio"]:checked').val()) {
    case 'advanced':
      params = {
        "route": "/api/drinks_recommend",
        "request": {
          'alcohol_level': $("#alcohol_level").val(),
          'distilled': $("#distilled").val(),
          'base_ingredient':  $("#base_ingredients").val(),
          'origin': $("#origin").val(),
          'pages': page
        }
      }
      break;
    case 'simple':
      params = {
        "route": "/api/drinks_name",
        "request": {
          'name': $("#name").val(),
          'pages': page
        }
      }
      break;
  }

  return params;
}

function request_api(params){
  $.ajax({
    url: params.route,
    data: params.request,
    method: "GET",
    dataType: "json"
  }).done(function(data) {
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
     reload_pagination(data.pages)
  })
}

function reload_pagination(total){
  qtd = total / 10;

  if (qtd < 1) {
    qtd = 1
  }

  $('.paginas').remove()

  for (var i = qtd; i >= 1; i--) {
    template = `
      <li class="page-item paginas" data-page="${i}"><a class="page-link" href="javascript: void(0)">${i}</a></li>
    `
    $('.page-first').after(template);
  }

  request_pages();
}

function request_pages(){
  $("[data-page]").click(function() {
    page = $(this).data('page')
    params =  set_parameters(page)
    request_api(params)
  })
}
