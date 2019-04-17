function validate_name(x){
	var name=x.value;
	var i=x.id;
	if (name==''){
		$("#nameWrong"+i).removeClass("d-none");
		$("#"+i).parent().parent().addClass("has-error has-feedback");
		$("#"+i).parent().parent().removeClass("has-success has-feedback");
		$("#notok"+i).addClass("glyphicon glyphicon-remove");
		$("#ok"+i).addClass("d-none");
		$("#notok"+i).removeClass("d-none");
		//$("#s"+i).css("border", "1px solid red");
		$("#first").attr("value","notok"+i);
		x.focus();
		return false;
	}
	else{
		$("#"+i).parent().parent().addClass("has-success has-feedback");
		$("#"+i).parent().parent().removeClass("has-error has-feedback");
		$("#nameWrong"+i).addClass("d-none");
		$("#ok"+i).addClass("glyphicon glyphicon-ok");
		$("#ok"+i).removeClass("d-none");
		$("#notok"+i).addClass("d-none");
		//$("#s"+i).css("border", "1px solid #ccc");
		$("#s"+i).css("border", "");
		$("#first").attr("value","notok"+i);
		return true;
	}
}
function validate_email(x){
	var email=x.value;
	var i=x.id;
	var regex = /^([a-zA-Z0-9\_\.\&])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
	if(!regex.test(email)){
		$("#nameWrong"+i).removeClass("d-none");
		$("#"+i).parent().parent().addClass("has-error has-feedback");
		$("#"+i).parent().parent().removeClass("has-success has-feedback");
		$("#notok"+i).addClass("glyphicon glyphicon-remove");
		$("#ok"+i).addClass("d-none");
		$("#notok"+i).removeClass("d-none");
		$("#s"+i).css("border", "1px solid red");
		$("#first").attr("value","notok"+i);
		x.focus();
		return false;
	}
	else{
		$("#"+i).parent().parent().addClass("has-success has-feedback");
		$("#"+i).parent().parent().removeClass("has-error has-feedback");
		$("#nameWrong"+i).addClass("d-none");
		$("#ok"+i).addClass("glyphicon glyphicon-ok");
		$("#ok"+i).removeClass("d-none");
		$("#notok"+i).addClass("d-none");
		$("#s"+i).css("border", "");
		$("#first").attr("value","notok"+i);
		return true;
	}
}
function validate_web(x){
	var website=x.value;
	var i=x.id;
	var check= /http:\/\//;
    var check1=/https:\/\//;
	if((!check.test(website)) && (!check1.test(website))){
		$("#nameWrong"+i).removeClass("d-none");
		$("#"+i).parent().parent().addClass("has-error has-feedback");
		$("#"+i).parent().parent().removeClass("has-success has-feedback");
		$("#notok"+i).addClass("glyphicon glyphicon-remove");
		$("#ok"+i).addClass("d-none");
		$("#notok"+i).removeClass("d-none");
		//$("#s"+i).css("border", "1px solid red");
		$("#first").attr("value","notok"+i);
		x.focus();
		return false;
	}
	else{
		$("#"+i).parent().parent().addClass("has-success has-feedback");
		$("#"+i).parent().parent().removeClass("has-error has-feedback");
		$("#nameWrong"+i).addClass("d-none");
		$("#ok"+i).addClass("glyphicon glyphicon-ok");
		$("#ok"+i).removeClass("d-none");
		$("#notok"+i).addClass("d-none");
		//$("#s"+i).css("border", "");
		$("#first").attr("value","notok"+i);
		return true;
	}
}
function valid_age(x){
	var i=x.id;
	var min = $('#min_age').val();
	
	if(($('#max_age').val()) != null)
		var max = $('#max_age').val();
	var minage = parseInt(min);
 	var maxage = parseInt(max);
 	if(!parseInt(max))
 		maxage=0;
 	if((maxage<minage) || (maxage==0)){
 		$("#nameWrong"+i).removeClass("d-none");
		$("#"+i).parent().parent().addClass("has-error has-feedback");
		$("#"+i).parent().parent().removeClass("has-success has-feedback");
		$("#notok"+i).addClass("glyphicon glyphicon-remove");
		$("#ok"+i).addClass("d-none");
		$("#notok"+i).removeClass("d-none");
		//$("#s"+i).css("border", "1px solid red");
		$("#first").attr("value","notok"+i);
		x.focus();
		return false;
 	}
 	else{
 		$("#"+i).parent().parent().addClass("has-success has-feedback");
		$("#"+i).parent().parent().removeClass("has-error has-feedback");
		$("#nameWrong"+i).addClass("d-none");
		$("#ok"+i).addClass("glyphicon glyphicon-ok");
		$("#ok"+i).removeClass("d-none");
		$("#notok"+i).addClass("d-none");
		//$("#s"+i).css("border", "");
		$("#first").attr("value","notok"+i);
 		return true;
 	}	
 }
function valid_password(x){
	var pass = x.value;
	var i=x.id;
	var regexp = /^([a-zA-Z0-9\_\!\@\#\.\&\*]){6,16}$/;
	//+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
	///^[a-zA-Z0-9!@#$%^&*]{6,16}$/;"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
	var minNumberofChars = 6;
	var maxNumberofChars = 16;
	if(pass.length < minNumberofChars || pass.length > maxNumberofChars){
		$("#passwordLength").removeClass("d-none");
		$("#"+i).parent().parent().addClass("has-error has-feedback");
		$("#"+i).parent().parent().removeClass("has-success has-feedback");
		$("#notok"+i).addClass("glyphicon glyphicon-remove");
		$("#ok"+i).addClass("d-none");
		$("#notok"+i).removeClass("d-none");
		//$("#s"+i).css("border", "1px solid red");
		x.focus();
		
		/*x.style.border="1px solid red";
		$("#passwordLength").removeClass("d-none");
		$("#notok"+i).addClass("glyphicon glyphicon-remove");
		$("#ok"+i).addClass("d-none");
		$("#notok"+i).removeClass("d-none");
		$("#s"+i).css("border", "1px solid red");
		x.focus();*/
		return false;
	}else{
		$("#passwordLength").addClass("d-none");
		if ((!regexp.test(pass))) {
			$("#passwordWrong").removeClass("d-none");
			$("#"+i).parent().parent().addClass("has-error has-feedback");
			$("#"+i).parent().parent().removeClass("has-success has-feedback");
			$("#notok"+i).addClass("glyphicon glyphicon-remove");
			$("#ok"+i).addClass("d-none");
			$("#notok"+i).removeClass("d-none");
			
			/*x.style.border="1px solid red";
			$("#passwordWrong").removeClass("d-none");
			$("#notok"+i).addClass("glyphicon glyphicon-remove");
			$("#ok"+i).addClass("d-none");
			$("#notok"+i).removeClass("d-none");
			$("#s"+i).css("border", "1px solid red");*/
			x.focus();
			return false;
		}
		else{ //((!(pass.length < minNumberofChars || pass.length > maxNumberofChars)) && regexp.test(pass)){
			$("#"+i).parent().parent().addClass("has-success has-feedback");
			$("#"+i).parent().parent().removeClass("has-error has-feedback");
			$("#passwordLength").addClass("d-none");
			$("#passwordWrong").addClass("d-none");
			$("#ok"+i).addClass("glyphicon glyphicon-ok");
			$("#ok"+i).removeClass("d-none");
			$("#notok"+i).addClass("d-none");
			//$("#s"+i).css("border", "1px solid #ccc");
			$("#s"+i).css("border", "");
			$("#first").attr("value","notok"+i);
			
			/*x.style.border="";
			$("#passwordLength").addClass("d-none");
			$("#passwordWrong").addClass("d-none");
			$("#ok"+i).addClass("glyphicon glyphicon-ok");
			$("#ok"+i).removeClass("d-none");
			$("#notok"+i).addClass("d-none");
			$("#s"+i).css("border", "");*/
			return true;
		}
	}
}
function validate_number(x){
	var number=x.value;
	var i=x.id;
	if (!(number.length == 10)){
		$("#nameWrong"+i).removeClass("d-none");
		$("#"+i).parent().parent().addClass("has-error has-feedback");
		$("#"+i).parent().parent().removeClass("has-success has-feedback");
		$("#notok"+i).addClass("glyphicon glyphicon-remove");
		$("#ok"+i).addClass("d-none");
		$("#notok"+i).removeClass("d-none");
		//$("#s"+i).css("border", "1px solid red");
		$("#first").attr("value","notok"+i);
		x.focus();
		return false;
	}
	else{
		$("#"+i).parent().parent().addClass("has-success has-feedback");
		$("#"+i).parent().parent().removeClass("has-error has-feedback");
		$("#nameWrong"+i).addClass("d-none");
		$("#ok"+i).addClass("glyphicon glyphicon-ok");
		$("#ok"+i).removeClass("d-none");
		$("#notok"+i).addClass("d-none");
		//$("#s"+i).css("border", "1px solid #ccc");
		$("#s"+i).css("border", "");
		$("#first").attr("value","notok"+i);
		return true;
	}
}