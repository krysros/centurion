<%inherit file="layout.mako"/>

<main class="container">
  <article>
    <header>
      <h4>
        <i class="bi bi-funnel"></i> Kryteria wyboru
      </h4>
    </header>
    <form method="post" action="select">
      <fieldset>
        <legend><i class="bi bi-currency-euro"></i> Produkt</legend>
        ${form.name.label}
  ${form.name(class_="select-name")}
  ${form.hidden_name(id="hidden_name")}
        % if form.name.errors:
        <small class="error">${' '.join(form.name.errors)}</small>
        % endif

        ${form.category.label}
  ${form.category(class_="select-category")}
  ${form.hidden_category(id="hidden_category")}
        % if form.category.errors:
        <small class="error">${' '.join(form.category.errors)}</small>
        % endif

        <div class="grid">
          <div>
            ${form.unit.label}
            ${form.unit(class_="select-unit")}
            ${form.hidden_unit(id="hidden_unit")}
            % if form.unit.errors:
            <small class="error">${' '.join(form.unit.errors)}</small>
            % endif
          </div>

          <div>
            ${form.currency.label}
            ${form.currency(class_="select-currency")}
            ${form.hidden_currency(id="hidden_currency")}
            % if form.currency.errors:
            <small class="error">${' '.join(form.currency.errors)}</small>
            % endif
          </div>
        </div>
      </fieldset>

      <fieldset>
        <legend><i class="bi bi-building"></i> Lokalizacja</legend>
        ${form.company.label}
  ${form.company(class_="select-company")}
  ${form.hidden_company(id="hidden_company")}
        % if form.company.errors:
        <small class="error">${' '.join(form.company.errors)}</small>
        % endif

        <div class="grid">
          <div>
            ${form.project.label}
            ${form.project(class_="select-project")}
            ${form.hidden_project(id="hidden_project")}
            % if form.project.errors:
            <small class="error">${' '.join(form.project.errors)}</small>
            % endif
          </div>

          <div>
            ${form.city.label}
            ${form.city(class_="select-city")}
            ${form.hidden_city(id="hidden_city")}
            % if form.city.errors:
            <small class="error">${' '.join(form.city.errors)}</small>
            % endif
          </div>
        </div>
      </fieldset>

      <button type="submit" class="contrast select-button">
        <i class="bi bi-search"></i> Pokaż
      </button>
    </form>
  </article>
</main>