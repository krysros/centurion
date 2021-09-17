<%inherit file="layout.mako"/>
<%include file="errors.mako"/>

<div class="container">
  <h2>Nowa cena</h2>
  <form method="post" action="add">
    <div class="row my-3">
      <div class="col">
        ${form.name.label}
        ${form.name(class_="form-control")}
      </div>
    </div>
    <div class="row my-3">
      <div class="col">
        ${form.category.label}
        ${form.category(class_="form-control")}
      </div>
      <div class="col">
        ${form.unit.label}
        ${form.unit(class_="form-control")}
      </div>
      <div class="col">
        ${form.cost.label}
        ${form.cost(class_="form-control", type="number", step="0.01")}
      </div>
      <div class="col">
        ${form.currency.label}
        ${form.currency(class_="form-control")}
      </div>
    </div>
    <div class="row my-3">
      <div class="col">
        ${form.company.label}
        ${form.company(class_="form-control")}
      </div>
    </div>
    <div class="row my-3">
      <div class="col">
        ${form.project.label}
        ${form.project(class_="form-control")}
      </div>
      <div class="col">
        ${form.city.label}
        ${form.city(class_="form-control")}
      </div>
    </div>
    <div class="row my-3">
      <div class="col">
        ${form.description.label}
        ${form.description(class_="form-control")}
      </div>
    </div>
    <button type="submit" class="btn btn-primary">Dodaj</button>
  </form>
</div>