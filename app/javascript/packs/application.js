// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap"
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

 $(function() {
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

$(function() {
	$('#add-new-cliente').hide();
	$('#add-cliente-btn').click(function() {
		$('#add-new-cliente').slideToggle(function() {
			$('#nombre_cliente').focus();
		});
		return false;
	});

	$('#save-cliente-btn').click(function(event) {
		event.preventDefault();

		var newcliente = $('#new_cliente');
		var inputCliente = newcliente.closest('.input-cliente');

		$.ajax({
			url: "/clientes", 
			method: "post",
			data: {
				 cliente: { nombre_fiscal: $('#nombre_fiscal').val(),
				 			nombre_comercial: $('#nombre_comercial').val(),
							rfc: $('#rfc').val(),
							calle_numero: $('#calle_numero').val(),
							colonia: $('#colonia').val(),
							poblacion: $('#poblacion').val(),
							estado: $('#estado').val(),
							codigo_postal: $('#codigo_postal').val(),
							telefono_oficina: $('#telefono_oficina').val(),
							correo: $('#correo').val(),
							medio_contacto: $('#medio_contacto').val()
				  } 
			},
			success: function (proyecto) {
				if(cliente.nombre_fiscal != null) {
					inputCliente.removeClass('has-error');
					inputCliente.next('.text-danger').remove();

					var newOption = $('<option />')
								.attr('value', cliente.id)
								.attr('selected', true)
								.text(cliente.nombre_fiscal);

					$('#solicitud_cliente_id').append(newOption);
					$('#add-new-cliente').hide();
					newCliente.val("");
					$('#nombre_fiscal').val("");
					$('#nombre_comercial').val("");
				    $('#rfc').val("");
				    $('#calle_numero').val("");
				    $('#colonia').val("");
				    $('#poblacion').val("");
				    $('#estado').val("");
				    $('#codigo_postal').val("");
				    $('#telefono_oficina').val("");
				    $('#correo').val("");
				    $('#medio_contacto').val("");
 
				}
			},
			error: function (xhr) {
				var errors = xhr.responseJSON;
				var error = errors.join(" , ");
				if (error) {
					

					inputCliente.next('.text-danger').detach();
					 
					 inputCliente
						.addClass('has-error')
						.after('<p class="text-danger">' + error + '</p>');
				}
			}

		});
	});
});

$(function() {
	$('#add-new-contacto').hide();
	$('#add-contacto-btn').click(function() {
		$('#add-new-contacto').slideToggle(function() {
			$('#new_contacto').focus();
		});
		return false;
	});
});


$(function() {
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

 
 

