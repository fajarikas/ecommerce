<!-- login_form.php -->

<h2>Login to Your Account</h2>
<form id="login_form" onsubmit="return false">
    <label for="email">Email:</label>
    <input type="email" class="form-control" id="email" name="email" required>
    
    <label for="password">Password:</label>
    <input type="password" class="form-control" id="password" name="password" required>
    
    <button type="submit" class="btn btn-primary" onclick="login()">Login</button>
</form>

<div id="login_result"></div>

<script>
    function login() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "login_user.php", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = xhr.responseText;
                document.getElementById("login_result").innerHTML = response;
            }
        };
        xhr.send("email=" + email + "&password=" + password);
    }
</script>