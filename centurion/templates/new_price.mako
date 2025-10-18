<%inherit file="layout.mako"/>

<form method="post" action="add" novalidate>
  <fieldset>
    <article>
      <header>Cena</header>
      ${form.name.label}
      ${form.name(aria_invalid='' + ('true' if form.name.errors else ''))}
      % if form.name.errors:
      <small>${' '.join(form.name.errors)}</small>
      % endif
      ${form.category.label}
      ${form.category(aria_invalid='' + ('true' if form.category.errors else ''))}
      % if form.category.errors:
      <small>${' '.join(form.category.errors)}</small>
      % endif
      ${form.unit.label}
      ${form.unit(aria_invalid='' + ('true' if form.unit.errors else ''))}
      % if form.unit.errors:
      <small>${' '.join(form.unit.errors)}</small>
      % endif
      ${form.cost.label}
      ${form.cost(aria_invalid='' + ('true' if form.cost.errors else ''))}
      % if form.cost.errors:
      <small>${' '.join(form.cost.errors)}</small>
      % endif
      ${form.currency.label}
      ${form.currency(aria_invalid='' + ('true' if form.currency.errors else ''))}
      % if form.currency.errors:
      <small>${' '.join(form.currency.errors)}</small>
      % endif
    </article>
  </fieldset>
  <fieldset>
    <article>
      <header>Metadane</header>
      ${form.company.label}
      ${form.company(aria_invalid='' + ('true' if form.company.errors else ''))}
      % if form.company.errors:
      <small>${' '.join(form.company.errors)}</small>
      % endif
      ${form.project.label}
      ${form.project(aria_invalid='' + ('true' if form.project.errors else ''))}
      % if form.project.errors:
      <small>${' '.join(form.project.errors)}</small>
      % endif
      ${form.city.label}
      ${form.city(aria_invalid='' + ('true' if form.city.errors else ''))}
      % if form.city.errors:
      <small>${' '.join(form.city.errors)}</small>
      % endif
    </article>
  </fieldset>
  <button type="submit">Dodaj</button>
</form>