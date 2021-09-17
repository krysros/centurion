<%inherit file="layout.mako"/>

<div class="container">
  <h2>${price.name}</h2>
  <h5>Cena</h5>
  <ul>
    <li>Kategoria: ${categories.get(price.category)}</li>
    <li>Jednostka: ${price.unit}</li>
    <li>Cena: ${price.cost}</li>
    <li>Waluta: ${price.currency}</li>
  </ul>
  <h5>Metadane</h5>
  <ul>
    <li>Firma: ${price.company}</li>
    <li>Projekt: ${price.project}</li>
    <li>Miasto: ${price.city}</li>
    <li>Dodano: ${price.timestamp.strftime('%Y-%m-%d %H:%M:%S')}</li>
  </ul>
  <h5>Opis</h5>
  <p>
    % if price.description:
      ${price.description}
    % else:
      ---
    % endif
  </p>
  <h5>Akcja</h5>
  <a href="../price/delete?id=${price.id}">Usuń</a>
</div>