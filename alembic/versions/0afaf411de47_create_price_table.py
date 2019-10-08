"""create price table

Revision ID: 0afaf411de47
Revises: 
Create Date: 2019-09-22 17:56:49.886944

"""
import datetime
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '0afaf411de47'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
        'price',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('name', sa.Unicode(200)),
        sa.Column('category', sa.Unicode(20)),
        sa.Column('unit', sa.Unicode(10)),
        sa.Column('cost', sa.Numeric(precision=10, scale=2)),
        sa.Column('currency', sa.Unicode(3)),
        sa.Column('company', sa.Unicode(100)),
        sa.Column('project', sa.Unicode(100)),
        sa.Column('city', sa.Unicode(100)),
        sa.Column('description', sa.Text()),
        sa.Column('timestamp', sa.DateTime, default=datetime.datetime.now)
    )


def downgrade():
    op.drop_table('price')
