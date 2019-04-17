
$(window).scroll(function() {
    if ($(window).scrollTop() > 0) {
        $(".head2").addClass('small-header');
        $(".headone").addClass('div-block');
        $(".headone").removeClass('d-none');

    }
    else {
        $(".head2").removeClass('small-header');
        $(".headone").removeClass('div-block');
        $(".headone").addClass('d-none');
    }
});

$(window).scroll(function() {
    if ($(window).scrollTop() > 400) {
        $(".flex").addClass('fix-flex');
        // $(".headone").addClass('div-block');
        // $(".headone").removeClass('d-none');

    }
    else {
        $(".flex").removeClass('fix-flex');
        // $(".headone").removeClass('div-block');
        // $(".headone").addClass('d-none');
    }
});

$(window).scroll(function() {
    if ($(window).scrollTop() > 230) {
        $(".steady").addClass('steady-form');
        // $(".headone").addClass('div-block');
        // $(".headone").removeClass('d-none');
    }
    else {
        $(".steady").removeClass('steady-form');
        // $(".headone").removeClass('div-block');
        // $(".headone").addClass('d-none');
    }
});


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


function validate_signupForm() {
var name = document.forms["signupForm"]["fullname"].value;
var email= val_email(document.forms["signupForm"]["email"].value);
var date= document.forms["signupForm"]["pickadate"].value;
if (name == "") {
  alert("FullName must be filled out.");
  return false;
}else{
      if (email==false) {
          alert("Email should be valid.");
          return false;
      }else{
          if(date=""){
              alert("Date field is mandatory.");
              return false;
          }
          else{
              return true;
          }
      }
  }
}

function validate_contactForm() {
  alert('hi');
  var name = document.forms["contactForm"]["name"].value;
  var email= val_email(document.forms["contactForm"]["email"].value);
  var msg= val_msg(document.forms["contactForm"]["message"].value);
  if (name == "") {
    alert("Name must be filled out.");
    return false;
  }else{
        if (email==false) {
            alert("Email should be valid.");
            return false;
        }else{
            if(msg.length>2000){
                alert("Message length should be less than 2000.");
                return false;
            }
            else{
                return true;
            }
        }
    }
  }