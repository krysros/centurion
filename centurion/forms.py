from wtforms import (
    DecimalField,
    Form,
    HiddenField,
    SelectField,
    StringField,
    TextAreaField,
)
from wtforms.validators import InputRequired, Length

CATEGORIES = [
    ("RMS", "RMS"),
    ("Bez materiału", "Bez materiału"),
    ("Robocizna", "Robocizna"),
    ("Materiał", "Materiał"),
    ("Sprzęt", "Sprzęt"),
]

CURRENCIES = [
    ("PLN", "PLN"),
    ("EUR", "EUR"),
    ("USD", "USD"),
]

EMPTY = [
    ("0", ""),
]


class InputDict(dict):
    def getlist(self, key):
        v = self[key]
        if not isinstance(v, (list, tuple)):
            v = [v]
        return v


def strip_filter(x):
    return x.strip() if x else ""


class PriceForm(Form):
    name = StringField(
        "Nazwa",
        [
            InputRequired("Podaj nazwę"),
            Length(
                min=3,
                max=200,
                message="Długość nazwy musi zawierać się "
                "w przedziale %(min)d-%(max)d",
            ),
        ],
        filters=[strip_filter],
    )

    category = SelectField("Kategoria", choices=CATEGORIES)

    unit = StringField(
        "Jednostka",
        [
            InputRequired("Podaj jednostkę"),
            Length(
                min=1,
                max=10,
                message="Długość jednostki musi zawierać się "
                "w przedziale %(min)d-%(max)d",
            ),
        ],
        filters=[strip_filter],
    )

    cost = DecimalField("Cena")

    currency = SelectField("Waluta", choices=CURRENCIES)

    company = StringField(
        "Firma",
        [
            InputRequired("Podaj nazwę firmy"),
            Length(
                min=3,
                max=100,
                message="Długość firmy musi zawierać się "
                "w przedziale %(min)d-%(max)d",
            ),
        ],
        filters=[strip_filter],
    )

    project = StringField(
        "Projekt",
        [
            InputRequired("Podaj projekt"),
            Length(
                min=3,
                max=100,
                message="Długość projektu musi zawierać się "
                "w przedziale %(min)d-%(max)d",
            ),
        ],
        filters=[strip_filter],
    )

    city = StringField(
        "Miasto",
        [
            InputRequired("Podaj miasto"),
            Length(
                min=2,
                max=100,
                message="Długość miasta musi zawierać się "
                "w przedziale %(min)d-%(max)d",
            ),
        ],
        filters=[strip_filter],
    )

    description = TextAreaField("Opis", filters=[strip_filter])


class SelectForm(Form):
    # Use text inputs for client-side autocomplete. We keep hidden_* fields
    # to carry the final selected values to the server when the form is submitted.
    name = StringField("Nazwa", filters=[strip_filter])
    category = SelectField("Kategoria", choices=CATEGORIES)
    unit = StringField("Jednostka", filters=[strip_filter])
    currency = SelectField("Waluta", choices=CURRENCIES)
    company = StringField("Firma", filters=[strip_filter])
    project = StringField("Projekt", filters=[strip_filter])
    city = StringField("Miasto", filters=[strip_filter])

    hidden_name = HiddenField("Nazwa")
    hidden_category = HiddenField("Kategoria")
    hidden_unit = HiddenField("Jednostka")
    hidden_currency = HiddenField("Waluta")
    hidden_company = HiddenField("Firma")
    hidden_project = HiddenField("Projekt")
    hidden_city = HiddenField("Miasto")
