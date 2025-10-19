<%inherit file="layout.mako"/>

<form method="post" action="add" novalidate>
  <fieldset>
    <article>
      <header>Cena</header>
        ${form.name.label}
        % if form.name.errors:
        ${form.name(aria_invalid="true", list="list-name", **{"hx-get": "/autocomplete?attr=name", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-name", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.name.errors)}</small>
        % else:
        ${form.name(list="list-name", **{"hx-get": "/autocomplete?attr=name", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-name", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-name"></datalist>
        ${form.category.label}
        % if form.category.errors:
        ${form.category(aria_invalid="true", list="list-category", **{"hx-get": "/autocomplete?attr=category", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-category", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.category.errors)}</small>
        % else:
        ${form.category(list="list-category", **{"hx-get": "/autocomplete?attr=category", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-category", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-category"></datalist>
        ${form.unit.label}
        % if form.unit.errors:
        ${form.unit(aria_invalid="true", list="list-unit", **{"hx-get": "/autocomplete?attr=unit", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-unit", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.unit.errors)}</small>
        % else:
        ${form.unit(list="list-unit", **{"hx-get": "/autocomplete?attr=unit", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-unit", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-unit"></datalist>
        ${form.cost.label}
        % if form.cost.errors:
        ${form.cost(aria_invalid="true", type="number", step="0.01")}
        <small>${" ".join(form.cost.errors)}</small>
        % else:
        ${form.cost(type="number", step="0.01")}
        % endif
        ${form.currency.label}
        % if form.currency.errors:
        ${form.currency(aria_invalid="true", list="list-currency", **{"hx-get": "/autocomplete?attr=currency", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-currency", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.currency.errors)}</small>
        % else:
        ${form.currency(list="list-currency", **{"hx-get": "/autocomplete?attr=currency", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-currency", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-currency"></datalist>
    </article>
  </fieldset>
  <fieldset>
    <article>
      <header>Metadane</header>
        ${form.company.label}
        % if form.company.errors:
        ${form.company(aria_invalid="true", list="list-company", **{"hx-get": "/autocomplete?attr=company", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-company", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.company.errors)}</small>
        % else:
        ${form.company(list="list-company", **{"hx-get": "/autocomplete?attr=company", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-company", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-company"></datalist>
        ${form.project.label}
        % if form.project.errors:
        ${form.project(aria_invalid="true", list="list-project", **{"hx-get": "/autocomplete?attr=project", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-project", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.project.errors)}</small>
        % else:
        ${form.project(list="list-project", **{"hx-get": "/autocomplete?attr=project", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-project", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-project"></datalist>
        ${form.city.label}
        % if form.city.errors:
        ${form.city(aria_invalid="true", list="list-city", **{"hx-get": "/autocomplete?attr=city", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-city", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.city.errors)}</small>
        % else:
        ${form.city(list="list-city", **{"hx-get": "/autocomplete?attr=city", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-city", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-city"></datalist>
    </article>
  </fieldset>
  <button type="submit">Dodaj</button>
</form>