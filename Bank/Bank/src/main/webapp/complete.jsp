<!DOCTYPE html>
<html>
  <head>
    <title>Transaction Successful</title>
  </head>
  <body>
    <h1>Transaction Successful</h1>
    <p>Your transaction has been processed successfully.</p>
    <p>You will be redirected to the home page in 5 seconds.</p>
    <script>
      setTimeout(function() {
        window.location.href = "index.jsp";
      }, 5000);
    </script>
  </body>
</html>