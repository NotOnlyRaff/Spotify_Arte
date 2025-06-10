import uuid
from fastapi import Depends, HTTPException
import bcrypt
import jwt
from models.user import User
from schemas.user_create import UserCreate
from fastapi import APIRouter
from database import get_db
from sqlalchemy.orm import Session

from schemas.user_login import UserLogin

router = APIRouter()

@router.post('/signup', status_code=201)
def signup_user(user: UserCreate, db: Session = Depends(get_db)):
    # check if the user already exists in db
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        raise HTTPException(400, 'User with the same email already exists!')
    
    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
    user_db = User(id=str(uuid.uuid4()), email=user.email, password=hashed_pw, name=user.name)
    
    # add the user to the db
    db.add(user_db)
    db.commit()
    db.refresh(user_db)


    
@router.post('/login', status_code=200)
def login_user(user: UserLogin, db: Session = Depends(get_db)):
    # check if a user with same email already exist
    user_db = db.query(User).filter(User.email == user.email).first()

    if not user_db:
        raise HTTPException(400, 'User with this email does not exist!')
    
    # password matching or not
    is_match = bcrypt.checkpw(user.password.encode(), user_db.password)
    
    if not is_match:
        raise HTTPException(400, 'Incorrect password!')
    

    ##token = jwt.encode({'id': user_db.id}, 'password_key')
    
    return {'user': user_db}
