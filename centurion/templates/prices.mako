<%inherit file="layout.mako"/>

<main class="container">
  <article>
    <div class="overflow-auto">
      <table>
        <thead>
          <tr>
            <th>Nazwa</th>
            <th>Kategoria</th>
            <th>Jedn.</th>
            <th>Cena</th>
            <th>Waluta</th>
            <th>Data</th>
            <th>Akcja</th>
          </tr>
        </thead>
        <tbody>
        % for price in prices:
          <tr>
            <td>
              <div>
                <a href="../price/display?id=${price.id}">
                  <strong>${price.name}</strong>
                </a>
                <div>
                  <a href="../company?name=${price.company}">${price.company}</a>
                  <i class="bi bi-arrow-right"></i>
                  <a href="../project?name=${price.project}">${price.project}</a>
                  <i class="bi bi-arrow-right"></i>
                  <a href="../city?name=${price.city}">${price.city}</a>
                </div>
              </div>
            </td>
            <td>${categories.get(price.category)}</td>
            <td>${price.unit}</td>
            <td>${price.cost}</td>
            <td>${price.currency}</td>
            <td>
              <span title="${price.timestamp.strftime('%Y-%m-%d %H:%M:%S')}">
                ${price.timestamp.strftime('%Y-%m-%d')}
              </span>
            </td>
            <td>
              <a href="../price/delete?id=${price.id}" class="secondary outline" onclick="return confirm('Czy na pewno chcesz usunąć?')">
                <i class="bi bi-trash"></i>
              </a>
            </td>
          </tr>
        % endfor
        </tbody>
      </table>
    </div>
  </article>
</main>