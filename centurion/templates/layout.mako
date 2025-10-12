<!doctype html>
<html lang="pl">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Centurion">
    <meta name="author" content="Krystian Rosiński">
    <title>Centurion</title>
    <!-- Pico CSS -->
    <link href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <!-- Custom CSS -->
    <link href="/static/css/theme.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- App JS -->
    <script src="/static/js/app.js"></script>
  </head>
  <body>
    <nav class="container-fluid">
      <ul>
        <li><a href="/" class="contrast"><strong><i class="bi bi-currency-euro"></i> Centurion</strong></a></li>
      </ul>
      <ul>
        <li><a href="/price/browse"><i class="bi bi-table"></i> Przeglądaj</a></li>
        <li><a href="/price/select"><i class="bi bi-funnel"></i> Wybierz</a></li>
        <li><a href="/price/add"><i class="bi bi-plus-circle"></i> Dodaj</a></li>
        <li>
          <form action="/price/search" method="get" role="search">
            <input type="search" name="q" placeholder="Szukaj" aria-label="Szukaj" required>
          </form>
        </li>
      </ul>
    </nav>
    <main>
      ${self.body()}
    </main>
  </body>
</html>