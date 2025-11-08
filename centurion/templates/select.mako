<%inherit file="layout.mako"/>

<form method="post" action="select">
  <fieldset>
    <article>
      <header>Cena</header>
      ${form.name.label}
      ${form.name(class_="select-name", list="list-name", **{"hx-get": "/autocomplete?attr=name", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-name", "hx-swap": "innerHTML"})}
      <datalist id="list-name"></datalist>
      ${form.typ.label}
      ${form.typ(class_="select-typ", list="list-typ", **{"hx-get": "/autocomplete?attr=typ", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-typ", "hx-swap": "innerHTML"})}
      <datalist id="list-typ"></datalist>
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
      ${form.source.label}
      ${form.source(class_="select-source", list="list-source", **{"hx-get": "/autocomplete?attr=source", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-source", "hx-swap": "innerHTML"})}
      <datalist id="list-source"></datalist>
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