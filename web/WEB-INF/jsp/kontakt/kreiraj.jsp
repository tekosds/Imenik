<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<center>
    <form action="kontakt/kreiraj" method="post" modelAttribute ="korisnik" > 
        <h2>Unesite podatke kontakta </h2> 
        <table class='table table-condensed table-align'>
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Ime</label>
                        <div class='col-xs-8'>
                            <input name="name" id="name" class='form-control' value='${kontakt.name}'/>
                        </div>
                    </div>
                </td>
            </tr> 
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Prezime</label>
                        <div class='col-xs-8'>
                            <input name="lastName" id="lastName"  class='form-control' value='${kontakt.lastName}'/>
                        </div>
                    </div>
                </td>
            </tr> 
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Broj telefona</label>
                        <div class='col-xs-8'>
                            <input  name="phoneNumber" id="phoneNumber"  class='form-control' value='${kontakt.phoneNumber}'/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Email</label>
                        <div class='col-xs-8'>
                            <input  name="email" id="email"  class='form-control' value='${kontakt.email}'/>
                        </div>
                    </div>
                </td>
            </tr>
        </table>   
        <button type="submit"  class="btn btn-primary">Dodaj</button>
    </form>
</center>
</body>

