<form action="kontakt/izmena/${kontakt.id}" method ="post" class='form-horizontal'>

    <div class='form-group'>
        <label class='control-label col-xs-4'>ime</label>
        <div class='col-xs-8'>
            <input name='name' class='form-control' value='${kontakt.name}'/>
        </div>
    </div>
    
    <div class='form-group'>
        <label class='control-label col-xs-4'>Prezime</label>
        <div class='col-xs-8'>
            <input name='lastName' class='form-control' value='${kontakt.lastName}'/>
        </div>
    </div>
        
    <div class='form-group'>
        <label class='control-label col-xs-4'>Broj telefona</label>
        <div class='col-xs-8'>
            <input name='phoneNumber' class='form-control' value='${kontakt.phoneNumber}'/>
        </div>
    </div>
        
    <div class='form-group'>
        <label class='control-label col-xs-4'>Email</label>
        <div class='col-xs-8'>
            <input name='email' class='form-control' value='${kontakt.email}'/>
        </div>
    </div>
        
    <div class='text-right'>
        <button type="submit" class="btn btn-primary"><span class="fa fa-fw fa-check"></span></button>
        <a href="kontakt/kontakt" class="btn btn-default"><span class="fa fa-fw fa-remove"></span></a>
    </div>

</form>

