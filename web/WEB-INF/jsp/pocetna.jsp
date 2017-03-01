<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<center>
        <table class='table table-condensed table-align'>
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Korisnicko ime</label>
                        <div class='col-xs-8'>
                            <input readonly="true" name="username" id="username" class='form-control' value='${korisnik.username}'/>
                        </div>
                    </div>
                </td>
            </tr> 
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Sifra</label>
                        <div class='col-xs-8'>
                            <input readonly="true" name="password" id="password"  class='form-control' value='${korisnik.password}'/>
                        </div>
                    </div>
                </td>
            </tr> 
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Broj telefona</label>
                        <div class='col-xs-8'>
                            <input  readonly="true" name="phoneNumber" id="phoneNumber"  class='form-control' value='${korisnik.phoneNumber}'/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class='form-group'>
                        <label class='control-label col-xs-4'>Email</label>
                        <div class='col-xs-8'>
                            <input readonly="true" name="email" id="email"  class='form-control' value='${korisnik.email}'/>
                        </div>
                    </div>
                </td>
            </tr>
        </table>   
    </form>
</center>
</body>

