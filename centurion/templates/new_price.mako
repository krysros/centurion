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
        ${form.typ.label}
        % if form.typ.errors:
        ${form.typ(aria_invalid="true", list="list-typ", **{"hx-get": "/autocomplete?attr=typ", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-typ", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.typ.errors)}</small>
        % else:
        ${form.typ(list="list-typ", **{"hx-get": "/autocomplete?attr=typ", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-typ", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-typ"></datalist>
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
        ${form.source.label}
        % if form.source.errors:
        ${form.source(aria_invalid="true", list="list-source", **{"hx-get": "/autocomplete?attr=source", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-source", "hx-swap": "innerHTML"})}
        <small>${" ".join(form.source.errors)}</small>
        % else:
        ${form.source(list="list-source", **{"hx-get": "/autocomplete?attr=source", "hx-trigger": "keyup changed delay:300ms", "hx-target": "#list-source", "hx-swap": "innerHTML"})}
        % endif
        <datalist id="list-source"></datalist>
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