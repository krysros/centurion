<%inherit file="layout.mako"/>

<table class="striped">
  <thead>
    <tr>
      <th scope="col">Nazwa</th>
      <th scope="col">Typ</th>
      <th scope="col">Jedn.</th>
      <th scope="col">Cena</th>
      <th scope="col">Waluta</th>
      <th scope="col">Data</th>
      <th scope="col">Akcja</th>
    </tr>
  </thead>
  <tbody>
  % for price in prices:
    <tr>
      <td>
        <div>
          <a href="../price/display?id=${price.id}">
            <strong>${price.name}</strong>
          </a>
        </div>
        <div>
          <small>
            <a href="../source?name=${price.source}">${price.source}</a> >
            <a href="../project?name=${price.project}">${price.project}</a> >
            <a href="../city?name=${price.city}">${price.city}</a>
          </small>
        </div>
      </td>
      <td>${types.get(price.typ)}</td>
      <td>${price.unit}</td>
      <td>${price.cost}</td>
      <td>${price.currency}</td>
      <td>${price.timestamp.strftime('%Y-%m-%d')}</td>
      <td>
        <a href="../price/delete?id=${price.id}" onclick="return confirm('Czy na pewno chcesz usunąć?')">
          Usuń
        </a>
      </td>
    </tr>
  % endfor
  </tbody>
</table>

