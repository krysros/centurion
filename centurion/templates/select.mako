<%inherit file="layout.mako"/>
<%include file="errors.mako"/>

<div class="container">
  <h2>Kryteria wyboru</h2>
  <form method="post" action="select">
    <div class="row my-3">
      <div class="col">
        ${form.name.label}
        ${form.name(class_="form-select select-name")}
        ${form.hidden_name}
      </div>
    </div>
    <div class="row my-3">
      <div class="col">
        ${form.category.label}
        ${form.category(class_="form-select select-category")}
        ${form.hidden_category}
      </div>
      <div class="col">
        ${form.unit.label}
        ${form.unit(class_="form-select select-unit")}
        ${form.hidden_unit}
      </div>
      <div class="col">
        ${form.currency.label}
        ${form.currency(class_="form-select select-currency")}
        ${form.hidden_currency}
      </div>
    </div>
    <div class="row my-3">
      <div class="col">
        ${form.company.label}
        ${form.company(class_="form-select select-company")}
        ${form.hidden_company}
      </div>
    </div>
    <div class="row my-3">
      <div class="col">
        ${form.project.label}
        ${form.project(class_="form-select select-project")}
        ${form.hidden_project}
      </div>
      <div class="col">
        ${form.city.label}
        ${form.city(class_="form-select select-city")}
        ${form.hidden_city}
      </div>
    </div>
    <button type="submit" class="btn btn-primary select-button">Pokaż</button>
  </form>
</div>