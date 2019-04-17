 function validateForm(){
       if (validate_name() == true) {
            if(validate_email() == true)
            {
              if (validate_message() == true) {
                alert("submitted");
              }
            }
       }
      }
       function validate_name() {
          var x = document.forms["myForm"]["name"].value;  
          if (x == "") {
            alert("Name must be filled out");
            document.myForm.name.focus();
            return false;
        }
        return true;
      }

      function validate_email()
      {
        
        var y = document.forms["myForm"]["mail"].value;
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
         if (y == "") {
            alert("Email must be filled out");
            document.myForm.mail.focus();
            return false;
              }
        if (reg.test(y) == false) 
            {
                alert('Invalid Email Address');
                document.myForm.email.focus();
                return false;
            }
          return true;
      }
      function validate_message()
      {
        var z = document.forms["myForm"]["message"].value;
        var lnth = z.length;
        if(lnth < 2)
        {
          alert("message length is short then required");
          document.myForm.message.focus();
          return false;
        }
        return true;
      }
// function validate_apply_now()
// {
//   var date = document.getElementById("datepicker").value;
//   var select = document.getElementById("select_week").value;
//   var btn = document.getElementById("apply_now").value;
//   if(date == "")
//   {
//     alert("fill the project date");
//     document.getElementById("apply_now").value = "1"
//     return false;
//   }
//   alert(btn);
//   if(select == "")
//   {
//     alert("Choose Duration");
//     document.getElementById("apply_now").value = "2"
//     return false;
//   }
//   alert(btn);
  
// }

function validate_sign_up()
{
    var fullName = document.getElementById("Full_name").value;
    var datepicker = document.getElementById("datepicker1").value;
    var selectOption = document.getElementById("select_week1").value;
    var mail = document.getElementById("mail").value;
    var phn = document.getElementById("phone").value;
    var date_regex = /^(0?[1-9]|1[0-2])\/(0?[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/;
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    var phnreg =/^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/;

    if(fullName == ""){
            alert("Full Name must be required");
            document.myForm.name.focus();
            return false;
    }
    if(datepicker == ""){
    alert("fill the project date");
        if(!date_regex.test(datepicker))
        {
          alert("Date should be in mm/dd/yyyy format");
          return false;
        }
        return false;
    }
    if(selectOption == "")
    {
          alert("Choose Duration");
          return false;
    }
    if(mail == "")
    {
      alert("Email Address is required");
       return false;
    }
     if (reg.test(mail) == false) 
    {
        alert('Invalid Email Address');
        document.myForm.mail.focus();
        return false;
    }
    if(phn)
    {
      if(phnreg.test(phn) == false)
      {
        alert("Phone number is not valid");
        return false;
      }
      alert('Signed up successfully!')
      return true;
    }
 else{
 alert("Signed up successfully!");
 return true;
    }
}
