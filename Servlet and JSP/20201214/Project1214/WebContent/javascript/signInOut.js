/**
 * script for signin / signout
 * 
 */

var signInOut = function() {
	var btnSignIn = document.getElementById("btnSignIn");
	var btnSignOut = document.getElementById("btnSignOut");
	
	if(btnSignIn != null) {
		btnSignIn.onclick = function() {
			var form = document.signinForm;
			form.action = "./member/signin.jsp";
			form.submit();
		}
	}
	
	if(btnSignOut != null) {
		btnSignOut.onclick = function() {
			location.href = "./member/signout.jsp";
		}
	}
}