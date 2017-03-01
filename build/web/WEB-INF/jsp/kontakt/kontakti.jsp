<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<a href="kontakt/kreiraj" style="float: right; width:120px " type="button"  class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>Dodaj</a>
<div class="col-sm-6">
    <div class="input-group">
        <span class="input-group-addon "><span class="glyphicon glyphicon-search"></span></span>
        <input type="text" class="form-control" id="search" placeholder="Pretrazi">
    </div>
</div>
<table id="table" class='table table-striped table-align'>
    <thead>
        <tr>
            <th style="visibility: hidden">Id kontakta</th>
            <th>Ime i prezime</th>
            <th>Broj telefona</th>
            <th> Email </th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${kontakti}" var="k" >
            <tr>

                <td style="visibility: hidden">
                    <p class='form-control-static'>
                        ${k.id}
                    </p>
                </td>
                <td>
                    <p class='form-control-static'>
                        ${k.name} ${k.lastName}
                    </p>
                </td>        
                <td>
                    <p class='form-control-static'>
                        ${k.phoneNumber}
                    </p>
                </td> 
                <td>
                    <p class='form-control-static'>
                        ${k.email}
                    </p>
                </td> 
                <td>
                    <div class='text-right'>
                        <div class='btn-group'>
                            <a href="kontakt/izmeni/${k.id}" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span></a>
                            <a href="kontakt/obrisi/${k.id}" onclick="return confirm('Da li zelite da obrisete kontakt ${k.name} ${k.lastName}')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a>
                        </div>
                    </div>
                </td>               
            </tr>
        </c:forEach>
    </tbody>
</table>
