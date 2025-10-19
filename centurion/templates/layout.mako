<!doctype html>
<html lang="pl">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="color-scheme" content="light dark">
    <meta name="description" content="Ceny 👷 robocizny, 🧱 materiałów i 🛠️ sprzętu">
    <meta name="author" content="krysros">
    <title>Centurion</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.classless.min.css">
    <script src="https://cdn.jsdelivr.net/npm/htmx.org@2.0.7/dist/htmx.min.js" integrity="sha384-ZBXiYtYQ6hJ2Y0ZNoYuI+Nq5MqWBr+chMrS/RkXpNzQCApHEhOt2aY8EJgqwHLkJ" crossorigin="anonymous"></script>
  </head>
  <body>
    <header>
      <nav>
        <ul>
          <li><strong>Centurion</strong></li>
        </ul>
        <ul>
          <li><a href="/">Szukaj</a></li>
          <li><a href="/price/browse">Przeglądaj</a></li>
          <li><a href="/price/select">Wybierz</a></li>
          <li><a href="/price/add"></i> Dodaj</a></li>
        </ul>
      </nav>
    </header>
    <main class="container">
      ${self.body()}
    </main>
    <footer>
      <p>&copy; KR 2025</p>
    </footer>
  </body>
</html>