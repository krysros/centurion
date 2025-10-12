<%inherit file="layout.mako"/>

<main class="container">
  <article>
    <header>
      <div class="grid">
        <div>
          <h4>${price.name}</h4>
        </div>
        <div style="text-align: right">
          <a href="../price/delete?id=${price.id}" class="secondary outline" onclick="return confirm('Czy na pewno chcesz usunąć?')">
            <i class="bi bi-trash"></i> Usuń
          </a>
        </div>
      </div>
    </header>
    <div class="grid">
      <article>
        <header>
          <i class="bi bi-currency-euro"></i> Cena
        </header>
        <dl>
          <dt>Kategoria:</dt>
          <dd>${categories.get(price.category)}</dd>
          <dt>Jednostka:</dt>
          <dd>${price.unit}</dd>
          <dt>Cena:</dt>
          <dd>${price.cost} ${price.currency}</dd>
        </dl>
      </article>
      <article>
        <header>
          <i class="bi bi-building"></i> Metadane
        </header>
        <dl>
          <dt>Firma:</dt>
          <dd>${price.company}</dd>
          <dt>Projekt:</dt>
          <dd>${price.project}</dd>
          <dt>Miasto:</dt>
          <dd>${price.city}</dd>
          <dt>Dodano:</dt>
          <dd>${price.timestamp.strftime('%Y-%m-%d %H:%M:%S')}</dd>
        </dl>
      </article>
    </div>
    % if price.description:
    <article>
      <header>
        <i class="bi bi-file-text"></i> Opis
      </header>
      <p>${price.description}</p>
    </article>
    % endif
  </article>
</main>