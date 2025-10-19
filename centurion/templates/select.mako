<%inherit file="layout.mako"/>

<form method="post" action="select">
  <fieldset>
    <article>
      <header>Cena</header>
      ${form.name.label}
      ${form.name(class_="select-name", list="list-name", **{"hx-get": "/autocomplete?attr=name", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-name", "hx-swap": "innerHTML"})}
      <datalist id="list-name"></datalist>
      ${form.category.label}
      ${form.category(class_="select-category", list="list-category", **{"hx-get": "/autocomplete?attr=category", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-category", "hx-swap": "innerHTML"})}
      <datalist id="list-category"></datalist>
      ${form.unit.label}
      ${form.unit(class_="select-unit", list="list-unit", **{"hx-get": "/autocomplete?attr=unit", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-unit", "hx-swap": "innerHTML"})}
      <datalist id="list-unit"></datalist>
      ${form.currency.label}
      ${form.currency(class_="select-currency", list="list-currency", **{"hx-get": "/autocomplete?attr=currency", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-currency", "hx-swap": "innerHTML"})}
      <datalist id="list-currency"></datalist>
    </article>
  </fieldset>
  <fieldset>
    <article>
      <header>Metadane</header>
      ${form.company.label}
      ${form.company(class_="select-company", list="list-company", **{"hx-get": "/autocomplete?attr=company", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-company", "hx-swap": "innerHTML"})}
      <datalist id="list-company"></datalist>
      ${form.project.label}
      ${form.project(class_="select-project", list="list-project", **{"hx-get": "/autocomplete?attr=project", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-project", "hx-swap": "innerHTML"})}
      <datalist id="list-project"></datalist>
      ${form.city.label}
      ${form.city(class_="select-city", list="list-city", **{"hx-get": "/autocomplete?attr=city", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-city", "hx-swap": "innerHTML"})}
      <datalist id="list-city"></datalist>
    </article>
  </fieldset>
  <button type="submit">Pokaż</button>
</form>