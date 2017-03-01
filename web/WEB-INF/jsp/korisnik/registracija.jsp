<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<center>
    <form action="korisnik/kreiraj" method="post" modelAttribute ="korisnik" > 
        <h2>Unesite Vase podatke </h2> 
        <table class='table table-condensed table-align'>
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Korisnicko ime</label>
                        <div class='col-xs-8'>
                            <input name="username" id="username" class='form-control' value='${korisnik.username}'/>
                        </div>
                    </div>
                </td>
            </tr> 
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Sifra</label>
                        <div class='col-xs-8'>
                            <input type="password" name="password" id="password"  class='form-control' value='${korisnik.password}'/>
                        </div>
                    </div>
                </td>
            </tr> 
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Broj telefona</label>
                        <div class='col-xs-8'>
                            <input  name="phoneNumber" id="phoneNumber"  class='form-control' value='${korisnik.phoneNumber}'/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Email</label>
                        <div class='col-xs-8'>
                            <input  name="email" id="email"  class='form-control' value='${korisnik.email}'/>
                        </div>
                    </div>
                </td>
            </tr>
        </table>   
        <button type="submit"  class="btn btn-primary">Registracija</button>
    </form>
</center>
</body>

