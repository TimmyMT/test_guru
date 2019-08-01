// Change color fields
document.addEventListener('turbolinks:load', function() {
  var passwordConfirm = document.querySelector('#user_password_confirmation');

  if (passwordConfirm) {
    passwordConfirm.addEventListener('input', writePass)
  }

  function writePass() {
    var password = document.querySelector('#user_password');
    var passwordConfirm = document.querySelector('#user_password_confirmation');

    if (passwordConfirm.value == '') {
      password.classList.remove('red-field');
      password.classList.remove('green-field');
      passwordConfirm.classList.remove('red-field');
      passwordConfirm.classList.remove('green-field')
    } else if (password.value == passwordConfirm.value) {
      password.classList.add('green-field');
      password.classList.remove('red-field');
      passwordConfirm.classList.add('green-field');
      passwordConfirm.classList.remove('red-field')
    } else {
      password.classList.add('red-field');
      password.classList.remove('green-field');
      passwordConfirm.classList.add('red-field');
      passwordConfirm.classList.remove('green-field')
    }
  }
});
