/**
 * Handles action for contact page
 */

//Tokenizer and custom form submission
$(document).ready(function() {

	$("#contact-submit").on("click", function(e) {
		e.preventDefault();
		var email = $("#contact-email").val();
		var name = $("#contact-name").val();
		var message = $("#contact-message").val();
		// request message on server
		xhrPost("api/contact", email, name, message, function(responseText){
			$("#contact-result").html("<h3>" + responseText + "</h3>");
			$("#contact-form").hide();
		}, function(error){
			console.log(error);
			$("#contact-result").val("<h3>" + error + "</h3>");
			$("#contact-result").addClass("error_explanation");
			$("#contact-form").hide();
		});
	});
	
});

//HTTP functions
function createXHR(){
	if(typeof XMLHttpRequest != "undefined"){
		return new XMLHttpRequest();
	}else{
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){}
		}
	}
	return null;
}

//HTTP functions
function xhrPost(url, email, name, message, callback, errback){
	var formData = new FormData();
	formData.append("contact-email", email);
	formData.append("contact-name", name);
	formData.append("contact-message", message);
	var xhr = new createXHR();
	xhr.open("POST", url, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status >= 200){
				callback(xhr.responseText);
			}else{
				errback("Houve um erro no envio da sua mensagem. Tente novamente.");
			}
		}
	};
	xhr.timeout = 5000;
	xhr.ontimeout = errback;
	xhr.send(formData);
}