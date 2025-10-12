<%inherit file="layout.mako"/>

<main class="container">
  <article>
    <header>
      <h4>
        <i class="bi bi-plus-circle"></i> Nowa cena
      </h4>
    </header>
    <form method="post" action="add" novalidate>
      <fieldset>
        <legend><i class="bi bi-currency-euro"></i> Cena</legend>
        ${form.name.label}
        ${form.name(class_="select2--large" + (' select2-error' if form.name.errors else ''))}
        % if form.name.errors:
        <small class="error">${' '.join(form.name.errors)}</small>
        % endif

        ${form.category.label}
        ${form.category(class_="select2--large" + (' select2-error' if form.category.errors else ''))}
        % if form.category.errors:
        <small class="error">${' '.join(form.category.errors)}</small>
        % endif

        <div class="grid">
          <div>
            ${form.unit.label}
            ${form.unit(class_="select2--large" + (' select2-error' if form.unit.errors else ''))}
            % if form.unit.errors:
            <small class="error">${' '.join(form.unit.errors)}</small>
            % endif
          </div>

          <div>
            ${form.cost.label}
            ${form.cost(type="number", step="0.01" + (' aria-invalid="true"' if form.cost.errors else ''))}
            % if form.cost.errors:
            <small class="error">${' '.join(form.cost.errors)}</small>
            % endif
          </div>

          <div>
            ${form.currency.label}
            ${form.currency(class_="select2--large" + (' select2-error' if form.currency.errors else ''))}
            % if form.currency.errors:
            <small class="error">${' '.join(form.currency.errors)}</small>
            % endif
          </div>
        </div>
      </fieldset>

      <fieldset>
        <legend><i class="bi bi-building"></i> Metadane</legend>
        ${form.company.label}
        ${form.company(class_="select2--large" + (' select2-error' if form.company.errors else ''))}
        % if form.company.errors:
        <small class="error">${' '.join(form.company.errors)}</small>
        % endif

        <div class="grid">
          <div>
            ${form.project.label}
            ${form.project(class_="select2--large" + (' select2-error' if form.project.errors else ''))}
            % if form.project.errors:
            <small class="error">${' '.join(form.project.errors)}</small>
            % endif
          </div>

          <div>
            ${form.city.label}
            ${form.city(class_="select2--large" + (' select2-error' if form.city.errors else ''))}
            % if form.city.errors:
            <small class="error">${' '.join(form.city.errors)}</small>
            % endif
          </div>
        </div>

        ${form.description.label}
        ${form.description(style="height: 100px" + (' aria-invalid="true"' if form.description.errors else ''))}
        % if form.description.errors:
        <small class="error">${' '.join(form.description.errors)}</small>
        % endif
      </fieldset>

      <button type="submit" class="primary">
        <i class="bi bi-check-lg"></i> Dodaj
      </button>
    </form>
  </article>
</main>