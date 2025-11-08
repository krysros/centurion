<%inherit file="layout.mako"/>

<article>
  <header>Cena</header>
  <ul>
    <li>Nazwa: <strong>${price.name}</strong></li>
    <li>Typ: <strong>${types.get(price.typ)}</strong></li>
    <li>Jednostka: <strong>${price.unit}</strong></li>
    <li>Cena: <strong>${price.cost} ${price.currency}</strong></li>
  </ul>
</article>

<article>
  <header>Metadane</header>
  <ul>
    <li>Źródło: <strong>${price.source}</strong></li>
    <li>Projekt: <strong>${price.project}</strong></li>
    <li>Miasto: <strong>${price.city}</strong></li>
    <li>Dodano: <strong>${price.timestamp.strftime('%Y-%m-%d %H:%M:%S')}</strong></li>
  </ul>
</article>

% if price.description:
<article>
  <header>Opis</header>
  <p>${price.description}</p>
</article>
% endif

<a role="button" href="../price/delete?id=${price.id}" onclick="return confirm('Czy na pewno chcesz usunąć?')">
  Usuń
</a>