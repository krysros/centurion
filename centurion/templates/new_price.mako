<%inherit file="layout.mako"/>

<form method="post" action="add" novalidate>
  <fieldset>
    <article>
      <header>Cena</header>
        ${form.name.label}
        ${form.name(aria_invalid='' + ('true' if form.name.errors else ''), list='list-name', **{"hx-get": "/autocomplete?attr=name", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-name", "hx-swap": "innerHTML"})}
        % if form.name.errors:
        <small>${' '.join(form.name.errors)}</small>
        % endif
        <datalist id="list-name"></datalist>
        ${form.category.label}
        ${form.category(aria_invalid='' + ('true' if form.category.errors else ''), list='list-category', **{"hx-get": "/autocomplete?attr=category", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-category", "hx-swap": "innerHTML"})}
        % if form.category.errors:
        <small>${' '.join(form.category.errors)}</small>
        % endif
        <datalist id="list-category"></datalist>
        ${form.unit.label}
        ${form.unit(aria_invalid='' + ('true' if form.unit.errors else ''), list='list-unit', **{"hx-get": "/autocomplete?attr=unit", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-unit", "hx-swap": "innerHTML"})}
        % if form.unit.errors:
        <small>${' '.join(form.unit.errors)}</small>
        % endif
        <datalist id="list-unit"></datalist>
        ${form.cost.label}
        ${form.cost(aria_invalid='' + ('true' if form.cost.errors else ''), type="number", step="0.01")}
        % if form.cost.errors:
        <small>${' '.join(form.cost.errors)}</small>
        % endif
        ${form.currency.label}
        ${form.currency(aria_invalid='' + ('true' if form.currency.errors else ''), list='list-currency', **{"hx-get": "/autocomplete?attr=currency", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-currency", "hx-swap": "innerHTML"})}
        % if form.currency.errors:
        <small>${' '.join(form.currency.errors)}</small>
        % endif
        <datalist id="list-currency"></datalist>
    </article>
  </fieldset>
  <fieldset>
    <article>
      <header>Metadane</header>
        ${form.company.label}
        ${form.company(aria_invalid='' + ('true' if form.company.errors else ''), list='list-company', **{"hx-get": "/autocomplete?attr=company", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-company", "hx-swap": "innerHTML"})}
        % if form.company.errors:
        <small>${' '.join(form.company.errors)}</small>
        % endif
        <datalist id="list-company"></datalist>
        ${form.project.label}
        ${form.project(aria_invalid='' + ('true' if form.project.errors else ''), list='list-project', **{"hx-get": "/autocomplete?attr=project", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-project", "hx-swap": "innerHTML"})}
        % if form.project.errors:
        <small>${' '.join(form.project.errors)}</small>
        % endif
        <datalist id="list-project"></datalist>
        ${form.city.label}
        ${form.city(aria_invalid='' + ('true' if form.city.errors else ''), list='list-city', **{"hx-get": "/autocomplete?attr=city", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-city", "hx-swap": "innerHTML"})}
        % if form.city.errors:
        <small>${' '.join(form.city.errors)}</small>
        % endif
        <datalist id="list-city"></datalist>
    </article>
  </fieldset>
  <button type="submit">Dodaj</button>
</form>