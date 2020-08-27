// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap"
import 'cocoon-js';	
require("gritter/js/jquery.gritter.js")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery-ui")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

 $(function() {
 	$('#term').autocomplete({
 		source: "/clientes/autocomplete",
 		minLenght: 3,
 		select: function(event, ui) {
 			$('#term').val(ui.item.value);
 		}


 		});
 });

 document.addEventListener("turbolinks:load", function() {
	$('#add-new-proyecto').hide();
	$('#add-proyecto-btn').click(function() {
		$('#add-new-proyecto').slideToggle(function() {
			$('#nombre_proyecto').focus();
		});
		return false;
	});

	$('#save-proyecto-btn').click(function(event) {
		event.preventDefault();

		var newProyecto = $('#nombre_proyecto');
		var inputProyecto = newProyecto.closest('.input-proyecto');

		$.ajax({
			url: "/proyectos", 
			method: "post",
			data: {
				 proyecto: { nombre_proyecto: $('#nombre_proyecto').val(),
				 			 empresa: $('#nombre_empresa').val(),
				 			 responsable: $('#nombre_responsable').val(),
				 			 comentarios: $('#comentarios').val()	

				  } 
			},
			success: function (proyecto) {
				if(proyecto.nombre_proyecto != null) {
					inputProyecto.removeClass('has-error');
					inputProyecto.next('.text-danger').remove();

					var newOption = $('<option />')
								.attr('value', proyecto.id)
								.attr('selected', true)
								.text(proyecto.nombre_proyecto);

					$('#solicitud_proyecto_id').append(newOption);
					$('#add-new-proyecto').hide();
					newProyecto.val("");
					$('#nombre_proyecto').val("");
					$('#nombre_empresa').val("");
					$('#nombre_responsable').val("");
					$('#comentarios').val("")	
				}
			},
			error: function (xhr) {
				console.log("hay errores");
				var errors = xhr.responseJSON;
				var error = errors.join(" , ");
				if (error) {
					

					inputProyecto.next('.text-danger').detach();
					 
					 inputProyecto
						.addClass('has-error')
						.after('<p class="text-danger">' + error + '</p>');
				}
			}

		});
	});
});

document.addEventListener("turbolinks:load", function() {
    var contactos;
    $('#contacto').hide();
    

    contactos = $('#solicitud_cliente_contacto_id').html();
    return $('#solicitud_cliente_id').change(function() {
      var cliente, options;
      cliente = $('#solicitud_cliente_id :selected').text();
      options = $(contactos).filter("optgroup[label='" + cliente + "']").html();
      if (options) {
        $('#solicitud_cliente_contacto_id').html(options);
        return $('#contacto').show();
         
      }
    });
  });

 
 

