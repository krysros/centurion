<%inherit file="layout.mako"/>

<form method="post" action="select">
  <fieldset>
    <article>
      <header>Cena</header>
      ${form.name.label}
      ${form.name(class_="select-name")}
      ${form.hidden_name}
      ${form.category.label}
      ${form.category(class_="select-category")}
      ${form.hidden_category}
      ${form.unit.label}
      ${form.unit(class_="select-unit")}
      ${form.hidden_unit}
      ${form.currency.label}
      ${form.currency(class_="select-currency")}
      ${form.hidden_currency}
    </article>
  </fieldset>
  <fieldset>
    <article>
      <header>Metadane</header>
      ${form.company.label}
      ${form.company(class_="select-company")}
      ${form.hidden_company}
      ${form.project.label}
      ${form.project(class_="select-project")}
      ${form.hidden_project}
      ${form.city.label}
      ${form.city(class_="select-city")}
      ${form.hidden_city}
    </article>
  </fieldset>
  <button type="submit">Pokaż</button>
</form>