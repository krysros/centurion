from wtforms.validators import (
    Length,
    InputRequired,
)

from wtforms import (
    Form,
    StringField,
    SelectField,
    DecimalField,
    TextAreaField,
    HiddenField,
)

CATEGORIES = [
    ('A', 'RMS'),
    ('R', 'Robocizna'),
    ('M', 'Materiał'),
    ('S', 'Sprzęt'),
]

CURRENCIES = [
    ('PLN', 'PLN'),
    ('EUR', 'EUR'),
    ('USD', 'USD'),
]


class InputDict(dict):
    def getlist(self, key):
        v = self[key]
        if not isinstance(v, (list, tuple)):
            v = [v]
        return v


def strip_filter(x):
    return x.strip() if x else ''


class PriceForm(Form):
    name = StringField(
        'Nazwa', [
            InputRequired('Podaj nazwę'),
            Length(min=3,
                   max=200,
                   message='Długość nazwy musi zawierać się '
                           'w przedziale %(min)d-%(max)d'),
            ],
        filters=[strip_filter],
        )

    category = SelectField('Kategoria', choices=CATEGORIES)

    unit = StringField(
        'Jednostka', [
            InputRequired('Podaj jednostkę'),
            Length(min=1,
                   max=10,
                   message='Długość jednostki musi zawierać się '
                           'w przedziale %(min)d-%(max)d'),
            ],
        filters=[strip_filter],
        )

    cost = DecimalField('Cena')

    currency = SelectField('Waluta', choices=CURRENCIES)

    company = StringField(
        'Firma', [
            InputRequired('Podaj nazwę firmy'),
            Length(min=3,
                   max=100,
                   message='Długość firmy musi zawierać się '
                           'w przedziale %(min)d-%(max)d'),
            ],
        filters=[strip_filter],
        )

    project = StringField(
        'Projekt', [
            InputRequired('Podaj projekt'),
            Length(min=3,
                   max=100,
                   message='Długość projektu musi zawierać się '
                           'w przedziale %(min)d-%(max)d'),
            ],
        filters=[strip_filter],
        )

    city = StringField(
        'Miasto', [
            InputRequired('Podaj miasto'),
            Length(min=2,
                   max=100,
                   message='Długość miasta musi zawierać się '
                           'w przedziale %(min)d-%(max)d'),
            ],
        filters=[strip_filter],
        )

    description = TextAreaField('Opis', filters=[strip_filter])


class SelectForm(Form):
    name = SelectField('Nazwa', choices=[('0', '')])
    category = SelectField('Kategoria', choices=CATEGORIES)
    unit = SelectField('Jednostka', choices=[('0', '')])
    currency = SelectField('Waluta', choices=CURRENCIES)
    company = SelectField('Firma', choices=[('0', '')])
    project = SelectField('Projekt', choices=[('0', '')])
    city = SelectField('Miasto', choices=[('0', '')])

    hidden_name = HiddenField('Nazwa')
    hidden_category = HiddenField('Kategoria')
    hidden_unit = HiddenField('Jednostka')
    hidden_currency = HiddenField('Waluta')
    hidden_company = HiddenField('Firma')
    hidden_project = HiddenField('Projekt')
    hidden_city = HiddenField('Miasto')
