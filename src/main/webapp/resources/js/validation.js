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
/* function validateLoginForm(){
	 
	 alert("inside validate name")
       if( validate_name() == true)
       {
         if(validate_password() == true )
         {
          alert('Signed In!');
         }
       }  
            
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
      function validate_password(){
    	  alert("inside validate name")
        var pass = document.forms["myForm"]["password"].value;
        var regexp = /^[a-zA-Z0-9!@#$%^&*]{6,16}$/;
        var minNumberofChars = 6;
        var maxNumberofChars = 16;
          if(pass.length < minNumberofChars || pass.length > maxNumberofChars){
        	  alert("inside validate name");
        	 alert('password length must be between 6 to 16 characters');
              document.myForm.password.focus();
              return false;
          }
          if (!regexp.test(pass)) {
              alert("password should contain atleast one number and one special character");
              return false;
          }
          if(pass == 'tatva123')
          {
          return true;
          }else
          {
           	alert('error');
          }
      }
function validate_Admin_Organization()
{
  var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
  var web_reg =/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
  var Org_name = document.getElementById("org_name").value;
  var org_mail = document.getElementById("org_mail").value;
  var org_web = document.getElementById("org_web").value;
  var contact_name = document.getElementById("contact_name").value;
  if(Org_name == "")
  {
    alert("Please Enter Organization Name");
    return false;
  }
  if(org_mail == "")
  {
    alert("Please Enter Organization Email");
    return false;
  }
     if (reg.test(org_mail) == false) 
    {
        alert('Invalid Email Address');
        document.myForm.org_mail.focus();
        return false;
    }
    if(contact_name == "")
  {
    alert("Please Enter Conatct Name");
    return false;
  }
  if(org_web)
  {
      if(web_reg.test(org_web) == false)
      {
        alert('Please enter proper web URL with http/https format');
        return false;
      }
      alert('Successfully Submitted!')
      return true;
  }
  else{
      alert('Successfully Submitted!')
      return true;
  }
  
}

function validate_Admin_Project()
{
  var org = document.getElementById("org").value;
  var cat = document.getElementById("cat").value;
  var activity = document.getElementById("activity").value;
  var title = document.getElementById("title").value;
  var min_age = document.getElementById("min_age").value;
  var max_age = document.getElementById("max_age").value;
  if(org == "")
  {
    alert("Please Choose Organization");
    return false;
  }
  if(cat == "")
  {
    alert("Please Choose Category");
    return false;
  }
  if(activity == "")
  {
    alert("Please Choose Activity");
    return false;
  }
  if(title == "")
  {
    alert("Please Enter Title");
    return false;
  }
  if(min_age == "")
  {
    alert("Please enter minimum age");
    return false;
  }
  if(max_age == "")
  {
    alert("Please enter Maximum age");
    return false;
  }
  if(min_age > max_age)
  {
    alert("Min age should not be bigger than max age")
  }
  else{
    alert("Successfully Submitted!");
    return true;
  }
}*/