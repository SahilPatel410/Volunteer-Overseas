	
/**
 * 
 */

// Log-In Page
function validateLoginForm(){
	var uname = document.forms['myForm']['email'].value;
	var pwd = document.forms['myForm']['password'].value;

	if (!valid_name(uname)) {
		alert('Username field must be filled.');
		return false;
	}
	else{
		if (pwd=='') {
			alert('Password field must be filled.');
			return false;
		}
		else {
			return true;
			/*if (uname!='sahil' || pwd!='tatva123') {
				alert('Username or/and Password invalid.');
				return false;
			}
			else{
				alert('Welcome '+uname+'.');
				return true;
			}*/
		}
	}
}
/*function validate_loginForm(){
	var uname = document.forms['loginForm']['username'].value;
	var pwd = document.forms['loginForm']['password'].value;

	if (!valid_name(uname)) {
		alert('Username field must be filled.');
		return false;
	}
	else{
		if (pwd=='') {
			alert('Password field must be filled.');
			return false;
		}
		else {return true;
			if (uname!='sahil' || pwd!='tatva123') {
				alert('Username or/and Password invalid.');
				return false;
			}
			else{
				alert('Welcome '+uname+'.');
				return true;
			}
		}
	}
}
*/
/*function validate_name(x){
	var name=x.value;
	if (name==''){
		x.style.border="1px solid red";
		return false;
	}
	else{
		x.style.border="";
		return true;
	}
}

function validate_password(x){
	//alert("inside validation password")
	var pass = x.value;
	var regexp = /^[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	var minNumberofChars = 6;
	var maxNumberofChars = 16;
	if(pass.length < minNumberofChars || pass.length > maxNumberofChars){
		alert('password length must be between 6 to 16 characters');
		x.focus();
		return false;
	}
	if (!regexp.test(pass)) {
		alert("password should contain atleast one number and one special character");
		x.focus();
		return false;
	}
	return true;
}*/
/*function val_email(email){
	var check= /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
	var email1 = check.test(email);
	return email1;
}
function valid_email(x){
	var mail=x.value;
	var check= /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
    var mail1 = check.test(mail);
	if (mail1==false){
		x.style.border="1px solid red";
		return false;
	}
	else{
		x.style.border="";
		return true;
	}
}*/
/*function val_website(website){
	var check= /http/;
	var check1=/https/;
	var website1 = check.test(website);
	if(website1==false){
		website1=check1.test(website);
	}
	return website1;
}
function valid_web(x){
	var website=x.value;
	var check= /http:\/\//;
    var check1=/https:\/\//;
    var website1 = check.test(website);
    if(website1==false){
    	website1=check1.test(website);
    }
    if (website1==false){
		x.style.border="1px solid red";
		return false;
    }
	else{
		x.style.border="";
		return true;
	}
}*/
// function valid_age(x){
// 	var minage = parseInt(document.getElementById('minage').value);
// 	var maxage = parseInt(document.getElementById('maxage').value);

// 	if(maxage<minage || maxage=''){
// 		x.style.border="1px solid red";
// 		return false;
// 	}
// 	else{
// 		x.style.border="";
// 		return true;
// 	}	
// }
// Organization Form Page
/*function Validate_OrganizationForm(){
	var orgname = document.forms['OrganizationForm']['orgname'].value;
	var orgwebsite = val_website(document.forms['OrganizationForm']['orgwebsite'].value);
	var orgemail = val_email(document.forms['OrganizationForm']['orgemail'].value);
	var contactname = document.forms['OrganizationForm']['contactname'].value;
	if (orgname=='') {
		alert('Organization name field must be filled.');
		return false;
	} else {
		if (orgemail==false) {
			alert('Organization email is invalid.');
			return false;
		} else {
			if (orgwebsite==false) {
				alert('Organization website must contain http/https.');
				return false;
			} else {
				if (contactname=='') {
					alert('Contact Name field must be filled.');
					return false;
				} else {
					alert('Project successfully added.');
					return true;
				}
			}
		}
	}
}*/
/*
function Validate_AddProjectForm(){
	var Organization = document.forms['AddProjectForm']['Organization'].value;
	var Activity = document.forms['AddProjectForm']['Activity'].value;
	var Category = document.forms['AddProjectForm']['Category'].value;
	var Title = document.forms['AddProjectForm']['Title'].value;
	var minage = parseInt(document.forms['AddProjectForm']['minage'].value);
	var maxage = parseInt(document.forms['AddProjectForm']['maxage'].value);
	
	if (Organization=='' && Activity=='' && Category=='' && Title=='' && minage=='' && maxage=='') {
		alert('First fill the form and then submit.');
		return false;
	} else {*/
		 /*if (Organization=='') {
		 	alert('Organization field must be filled.');
			return false;
		 } else {
		 	if (Activity=='') {
		 		alert('Activity field must be filled.');
		 		return false;
		 	} else {
		 		if (Category=='') {
		 			alert('Category field must be filled.');
		 			return false;
		 		} else {
		 			if (Title=='') {
		 				alert('Title field must be filled.');
		 				return false;
		 			} else {
		 				if (minage=='' && maxage=='') {
							alert('Min-Max age field must be filled.');
		 					return false;
		 				} else {*/
							/*if (minage>maxage) {
								alert('Minimum age is greater than Maximum age.');
								return false;
							}
							else{
								alert('Project successfully added.');
								return true;
	 						}*/
	 	/*				}
	 				}
	 			}
	 		}
	 	}*/
/*	}
}*/

// Add Project Form Page
// function Validate_AddProjectForm(){
// 	var Organization = document.forms['AddProjectForm']['Organization'].value;
// 	var Activity = document.forms['AddProjectForm']['Activity'].value;
// 	var Category = document.forms['AddProjectForm']['Category'].value;
// 	var Title = document.forms['AddProjectForm']['Title'].value;
// 	var minage = parseInt(document.forms['AddProjectForm']['minage'].value);
// 	var maxage = parseInt(document.forms['AddProjectForm']['maxage'].value);
	
// 	if (Organization=='' && Activity=='' && Category=='' && Title=='' && minage=='' && maxage=='') {
// 		alert('First fill the form and then submit.');
// 		return false;
// 	} else {
// 		if (Organization=='') {
// 			alert('Organization field must be filled.');
// 			return false;
// 		} else {
// 			if (Activity=='') {
// 				alert('Activity field must be filled.');
// 				return false;
// 			} else {
// 				if (Category=='') {
// 					alert('Category field must be filled.');
// 					return false;
// 				} else {
// 					if (Title=='') {
// 						alert('Title field must be filled.');
// 						return false;
// 					} else {
// 						if (minage=='' && maxage=='') {
// 							alert('Min-Max age field must be filled.');
// 							return false;
// 						} else {
// 							if (minage>maxage) {
// 								alert('Minimum age is greater than Maximum age.');
// 								return false;
// 							}
// 							else{
// 								alert('Project successfully added.');
// 								return true;
// 							}
// 						}
// 					}
// 				}
// 			}
// 		}
// 	}
// }


/*
function val_email(email)
{
    var check= /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
    var email1 = check.test(email);
    return email1;
}

function val_msg(msg){
    // var msg=document.forms["contactForm"]["message"].value;
    return msg.length;
}

function validate_name() {
	   alert("inside validate name")
   var x = document.forms["myForm"]["email"].value;  
   alert(x)
	if (x == " ") {
		alert("Username must be filled out");
		document.myForm.email.focus();
		return false;
	}
   return true;
}
*/
/*
function validate_password(){
	alert("inside password")
	var pass = document.forms["myForm"]["password"].value;
	var regexp = /^[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	var minNumberofChars = 6;
	var maxNumberofChars = 16;
	if(pass.length < minNumberofChars || pass.length > maxNumberofChars){
		alert('password length must be between 6 to 16 characters');
		document.myForm.password.focus();
		return false;
	}
	if (!regexp.test(pass)) {
		alert("password should contain atleast one number and one special character");
		document.myForm.password.focus();
		return false;
	}
	return true;
}*/