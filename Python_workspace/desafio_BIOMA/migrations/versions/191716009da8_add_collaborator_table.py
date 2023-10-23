"""primeira

Revision ID: 191716009da8
Revises: 
Create Date: 2023-10-23 17:40:43.917528

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '191716009da8'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table(
        'collaboratorators',
        sa.Column('id', sa.Integer, primary_key=True, index=True),
        sa.Column('name', sa.String(100), nullable=False),
        sa.Column('email', sa.String(100), nullable=False)
    )

def downgrade() -> None:
    op.drop_table('collaborators')
