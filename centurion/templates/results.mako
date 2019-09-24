<%inherit file="layout.mako"/>

<div class="container main">
  <h1><small class="text-muted">${smalltext}</small> ${header}</h1>
  <div class="row">
    <div class="col">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Nazwa</th>
            <th>Kategoria</th>
            <th>Jedn.</th>
            <th>Cena</th>
            <th>Waluta</th>
            <th>Data</th>
            <th>Akcja</th>
          </tr>
        </thead>
        <tbody>
        % for price in prices:
          <tr>
            <td><a href="../price/display?id=${price.id}"><strong>${price.name}</strong></a><br>
              <small><a href="../company?name=${price.company}">${price.company}</a> &#8594; <a href="../project?name=${price.project}">${price.project}</a> &#8594; <a href="../city?name=${price.city}">${price.city}</a></small>
            </td>
            <td>${categories.get(price.category)}</td>
            <td>${price.unit}</td>
            <td>${price.cost}</td>
            <td>${price.currency}</td>
            <td>${price.timestamp.strftime('%Y-%m-%d')}</td>
            <td><a href="../price/delete?id=${price.id}">Usuń</a></td>
          </tr>
        % endfor
        </tbody>
      </table>
    </div>
  </div>
</div>