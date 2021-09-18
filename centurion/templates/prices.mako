<%inherit file="layout.mako"/>

<div class="container">
  <div class="table-responsive">
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
          <td class="align-middle">${categories.get(price.category)}</td>
          <td class="align-middle">${price.unit}</td>
          <td class="align-middle">${price.cost}</td>
          <td class="align-middle">${price.currency}</td>
          <td class="align-middle">${price.timestamp.strftime('%Y-%m-%d %H:%M:%S')}</td>
          <td class="align-middle">🗑️ <a href="../price/delete?id=${price.id}">Usuń</a></td>
        </tr>
      % endfor
      </tbody>
    </table>
    </div>
  </div>
</div>