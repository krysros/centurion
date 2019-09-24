<%inherit file="layout.mako"/>

<div class="container main">
  <%include file="errors.mako"/>
  <h2>Kryteria wyboru</h2>
  <form method="post" action="select">
    <div class="form-group">
      ${form.name.label}
      ${form.name(class_="form-control select-name")}
      ${form.hidden_name}
    </div>
    <div class="row">
      <div class="col">
        <div class="form-group">
          ${form.category.label}
          ${form.category(class_="form-control select-category")}
          ${form.hidden_category}
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          ${form.unit.label}
          ${form.unit(class_="form-control select-unit")}
          ${form.hidden_unit}
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          ${form.currency.label}
          ${form.currency(class_="form-control select-currency")}
          ${form.hidden_currency}
        </div>
      </div>
    </div>
    <div class="form-group">
      ${form.company.label}
      ${form.company(class_="form-control select-company")}
      ${form.hidden_company}
    </div>
    <div class="row">
      <div class="col">
        <div class="form-group">
          ${form.project.label}
          ${form.project(class_="form-control select-project")}
          ${form.hidden_project}
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          ${form.city.label}
          ${form.city(class_="form-control select-city")}
          ${form.hidden_city}
        </div>
      </div>
    </div>
    <button type="submit" class="btn btn-primary select-button">Pokaż</button>
  </form>
</div>