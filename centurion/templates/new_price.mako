<%inherit file="layout.mako"/>

<div class="container main">
  <%include file="errors.mako"/>
  <h2>Nowa cena</h2>
  <form method="post" action="add">
    <div class="form-group">
      ${form.name.label}
      ${form.name(class_="form-control")}
    </div>
    <div class="row">
      <div class="col">
        <div class="form-group">
          ${form.category.label}
          ${form.category(class_="form-control")}
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          ${form.unit.label}
          ${form.unit(class_="form-control")}
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          ${form.cost.label}
          ${form.cost(class_="form-control")}
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          ${form.currency.label}
          ${form.currency(class_="form-control")}
        </div>
      </div>
    </div>
    <div class="form-group">
      ${form.company.label}
      ${form.company(class_="form-control")}
    </div>
    <div class="row">
      <div class="col">
        <div class="form-group">
          ${form.project.label}
          ${form.project(class_="form-control")}
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          ${form.city.label}
          ${form.city(class_="form-control")}
        </div>
      </div>
    </div>
    <div class="form-group">
      ${form.description.label}
      ${form.description(class_="form-control")}
    </div>
    <button type="submit" class="btn btn-primary">Dodaj</button>
  </form>
</div>