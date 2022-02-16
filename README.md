# Sentiment Analysis for online products and their fan pages

## Category:

- E-commerce / E-selling

- Application

- Retail

- Consumer product

## Overview

Building a system for business insights & analysis using Natural Language Processing of customer dialogs & participating in Project Planning, Data Operations, Model Engineering, Machine Learning, Visualization while using at all production stages: 

-	SQL (extract, organize data from customer conversations on Facebook Fan Page), 

-	Python (conduct Exploratory Data Analysis to refine datasets, use SQLAlchemy as Object Relation Mapper on Virtual Environment to read, insert CSV files, translate Python classes, load large data to created tables on the relational database, handle large-scale datasets efficiently by Batch Processing) 

-	TablePlus (create & design tables in this MySQL Relational Database for receiving datasets from Python & execute SQL queries),

-	Tableau (visualize refined datasets for insights of customer sentiment), 

-	Docker (run & manage applications), 

- Flask (route web traffic through HTTP requests to specific functions in the code base),

- SQLAlchemy (make the interaction between Python and our database smoother),

- Flask-SQLAlchemy (make the interaction between Flask and SQLAlchemy smoother).

## Courtesy:

This project was conducted by me during my last remote internship for the Center of Talent in AI (CoTAI), Sai Gon, Vietnam from Toronto, Canada. Hereby, I thank Mr. Hung Ngo - Founder of CoTAI and Mr. Huy Le - my supervisor there who had provided support, vision, guidance through this project. The private content of this dataset had been hidden and transformed to avoid data leakage so I could upload it to my e-portoflio as a proof of work experience. This project can also be upgraded, expanded as per my noted Room for Enhancement below.

## Targets & Achievements:

An online retail business should be able to use their vast amounts of data and information in such a way that impacts the business, including:

Tracking customer & sales activites 

- Identifying purchase habits

- Detecting user trends and patterns

- Recommending purchases

- Determining price optimizations

- Identifying potential & complaining customers

## Room for Enhancement:

- Applying LODs (Level of Details) in Tableau to establish new variables to improve performance, readability and troubleshoot multiple steps in the analysis:

+ How long to get the confirmation

+ Statistics for each customer

+ Performance of each Fan Page 

+ Address: which living area generates more online shopping activities

+ When confirming the transaction, what do customers usually talk to Sales team?

+ What do customers say to start their conversations, ask about products, ask for promotions?


- Creating new columns from the original dataset for further combined analysis

- Generating geographical columns from customer dialogs to analyze based on customer's shipping address (city, region, district, ward)

- Conducting Predictive Analysis to predict future trend based on timeline from Tableau's Machine Learning, Prescriptive Analysis to determine which actions should be taken to achieve a goal or target (this may require more business numerical columns provided by the stakeholders to execute), Cognitive Analysis to learn what might happen if circumstances change and determine how we might handle these situations.

- Creating the dashed horizontal line denoting a certain percentile of daily sales for the period shown

- Creating a reference line to show which customers are above the median purchases and employees are above the median sales target (if this variable is provided later) by making a percentile line by using the measure and set the percentile to an expected percentage.

## Dataset:

Orginally, the dataset consists of:
| ID | Fanpage | PSID | FanpageName	| CusName | Message	| CustomerCount |	SalesCount | TotalCount | StartTime | EndTime | isGiamCan | isChotDon | GD1 | CanUseDoccano |
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|

However, I would not use the last 4 columns and splitted the original file into new tables as below based on different categories after tryign to understand which type I have from the orignal dataset to put them into different purposes. Most often, the reasons for splitting a table vertically are performance related and/or restriction of data access. Having a table where most of the external applications access one set of data more often (e.g. persons’ name, SSN etc.) while other data (e.g. person’s picture) is required less, often the performance can be improved by splitting the table and move the less accessed columns into another table. This will improve the time to retrieve data from a table (on Jupyter, SQL Database, Tableau or Power BI platforms), especially in cases of applications that select all columns from a table. Another example of vertical table partitioning is restricting access to some information within a table (e.g. salary, password, login information etc.). By splitting a table and moving columns that need to be protected, different access rights to a table that contains sensitive data can be assigned.

`Conversation:`

|Message_ID | Fanpage | PSID	| FanpageName	| CusName |	Message | Conversation_ID | Sender |
|-|-|-|-|-|-|-|-|

`Conversation_Information:`

| ID | Conversation_ID | CustomerCount | SalesCount	| StartTime	| EndTime |
|-|-|-|-|-|-|

`Customer:`

| ID | PSID | CusName |
|-|-|-|

`Fan Page:`
| ID | Fanpage | FanpageName | 
|-|-|-|

`Conversation_Intention:`

| Conversation_ID | Intention_Label | Intention_Score | 
|-|-|-|

`Conversation Entities:`

| Conversation_ID | Conversation_Entity | Conversation_Entity_Score | Conversation_Entity_Word |
|-|-|-|-|

## Installling 

Docker 

MySQL 

Database Management GUI (recommended TablePlus or Workbench)

Virtual Enviroment:

- jupyter lab: https://jupyter.org/install

- pandas

- numpy

- matloblib

- seaborn

- sqlachemy

+ Overview of SQLAlchemy’s Expression Language and ORM Queries: https://www.pythoncentral.io/overview-sqlalchemys-expression-language-orm-queries/

+ SQLAlchemy ORM Examples: https://www.pythoncentral.io/sqlalchemy-orm-examples/

+ Samples for further tasks: https://www.pythonsheets.com/notes/python-sqlalchemy.html

Jupyter 

Ubuntu 18.04 LTS

## Flows for Python's Virtual Environment (VE):

- Install Python

Full steps: https://docs.python.org/3/tutorial/venv.html

- Upgrade pip

- Install Python VE

- Create VE

Creation of virtual environments: https://docs.python.org/3/library/venv.html

- Activate VE

- Added Virtual Environment to Jupyter Notebook: https://janakiev.com/blog/jupyter-virtual-envs/

```
ipython kernel install --user --name=YOUR_ENV_NAME
```

- Upgrade pip in VE


## Start Docker on Command Prompt

```
docker run -d --name mysql  --privileged=true -e MYSQL_ROOT_PASSWORD="..."   -e MYSQL_USER="..."   -e MYSQL_PASSWORD="..."   -e MYSQL_DATABASE="customerintention"  -p 3306:3306   bitnami/mysql:5.7
```

## Open Jupyter Lab in the Virtual Environment

Run Command Prompt as Administrator >

```
cd C:\Programming\CustomerIntention\venv\Scripts
C:\Programming\CustomerIntention\venv\Scripts>activate
cd ..
cd ..
(venv) C:\Programming\CustomerIntention>cd src\notebook
(venv) C:\Programming\CustomerIntention>cd src\notebook\jupyter lab
```

## Jupyter Lab in the Virtual Environment

Jupyter > File > New > Terminal
```
PS C:\Programming\CustomerIntention\venv\Scripts> activate
```

For Jupyter Terminal venv
```
(PS C:\Programming\CustomerIntention\venv\Scripts>
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
pip install mysqlclient
```

VR Flask:

- Flask, which I used to route web traffic through HTTP requests to specific functions in the code base

- SQLAlchemy, which I used to make the interaction between Python and our database smoother.

- Flask-SQLAlchemy, which I used to make the interaction between Flask and SQLAlchemy smoother.

```
pip install flask sqlalchemy flask-sqlalchemy
```
![image](https://user-images.githubusercontent.com/70437668/154194504-b2162d99-a644-4256-8854-a2d43a64886b.png)

# **`Database Administering:`**

## Design & map SQL Alchemy's 6 tables with MySQL relation database 

### 1/ Import libraries
```
import pandas as pd
import numpy as np
import csv
from sqlalchemy import Column, String, Integer, ForeignKey, DateTime, func, Boolean, MetaData, Table, Float
from sqlalchemy.dialects.mysql import TINYINT
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declarative_base
import requests
import json
from tqdm import tqdm
```

### 2/ Create an engine
```
from sqlalchemy import create_engine
engine = create_engine('mysql+mysqldb://phuongdaingo:0505@localhost:3306/customerintention', echo=True) 
```

### 3/ Design and map SQL Alchemy's tables with TablePlus relational database's tables
```
Base = declarative_base() 
metadata = MetaData(bind=engine) 
class Conversation(Base):
    __tablename__ = 'conversation'
    ID = Column(Integer, primary_key=True) 
    Fanpage = Column(Integer) # Fan_Page_ID
    PSID = Column(Integer) # Cus_ID or Customer_ID
    FanpageName = Column(String()) 
    CusName = Column(String()) 
    Message = Column(String())
    Order = Column(Integer) 
    Sender = Column(Integer) 
    
class Conversation_Information(Base):
    __tablename__ = 'Conversation_Information' 
    ID = Column(Integer, primary_key=True)
    Conversation_ID = Column(Integer)
    CustomerCount = Column(Integer)
    SalesCount = Column(Integer)
    StartTime = Column(
        DateTime,
        default=func.now())
    EndTime = Column(
        DateTime,
        default=func.now())
    
class Customer(Base):
    __tablename__ = 'Customer'
    ID = Column(Integer, primary_key=True)
    CusName = Column(String())
    CusID = Column(Integer)
    
class Fan_Page(Base):
    __tablename__ = 'Fan_Page'
    ID = Column(Integer, primary_key=True)
    FanpageName = Column(String())
    FanpageID = Column(Integer)
    
class Conversation_Intention(Base):
    __tablename__ = Table('conversation_intention', Base.metadata,
                    autoload=True, autoload_with=engine) # metadata goes from database 
    # Database (TablePlus) will regularize PK, Python won't dp so (primary_key=True) since this is for mapping tables only. 
    # If Python is used for creating tables, we will need ID as a PK so 'primary_key=True' will be included.
    id = Column(Integer, primary_key=True) 
    conversation_id = Column(Integer)
    reference_id = Column(Integer)
    intention = Column(String())
    score = Column(Float) # must have data type, Integer doesn't need to have Integer(8)
    
class Conversation_Entities(Base):
    __tablename__ = Table('conversation_entities', Base.metadata,
                    autoload=True, autoload_with=engine) # metadata goes from database 
    # Database (TablePlus) will regularize PK, Python won't dp so (primary_key=True) since this is for mapping tables only. 
    # If Python is used for creating tables, we will need ID as a PK so 'primary_key=True' will be included.
    id = Column(Integer, primary_key=True) 
    conversation_id = Column(Integer)
    conversation_entity = Column(Integer)
    conversation_entity_score = Column(Float)
    conversation_entity_string = Column(String()) # must have data type, Integer doesn't need to have Integer(8)
    
# Mapping classes with tables in TablePlus's databases
# Should not create tables by Python but TablePlus
from sqlalchemy.orm import sessionmaker
Session = sessionmaker(bind=engine) 
session = Session() # object
```

# **`Data Engineering:`**

I splitted the usage methods into 2 cases A and B. A would show how to creating CSV files and have those files imported to the MySQL Database or Tableau/Power BI for further analysis. B would demonstrate how to insert the dataframes containing the API-generated dataset into the MySQL Database directly. For further tasks relating managing the API of making calls and receiving responses. The Data Engineering team in Vietnam would help to run the Case B's codes I wrote below to input data into the MySQL as the API Server is based in Vietnam. So it would be not time-efficient to make calls from Canada and getting responses for millions of rows from Vietnam travelling half of the Earth through Pacific Ocean to arrive in Toronto. My coding lines of both cases are genuine and were examined.

## A. Creating CSV files from dataset by Batch Processing

As I already have 4 other CSV files from my previous EDA notebooks, including Conversation, Coversation_Information, Customer and Fan Page, now I will generate 2 more CSV files: Intention and Entities from the Conversation filtered with only Customer as Sender.

### 1/ Import libraries
```
import pandas as pd
import numpy as np
import csv
import requests
import json
from tqdm import tqdm
```

### 2/ Load CSV file of Customer Filtered Conversation
```
df_customer_filtered_Conversation = pd.read_csv("C:\Programming\CustomerIntention\src\data\customer_filtered_Conversation.csv", encoding = 'utf-8') 
```

### 3/ Prepare to insert all rows from Conversation to CSV files
```
object_length = df_customer_filtered_Conversation.shape[0]
object_ids = df_customer_filtered_Conversation['Coversation_ID'].values[:object_length] 
object_messages = df_customer_filtered_Conversation['Message'].values[:object_length] 
```

### 4/ Create 7 new lists for the new 2 CSV files: Conversation Intention & Entities
The 6 new lists contain Entity, Entity Score, Entity Word, Conversation ID, Intention Label, Intention Score of the Customer Intention table
```
conversation_intention_conversation_id = []
conversation_intention_label = []
conversation_intention_score = []

conversation_entities_conversation_id = []
conversation_entity = []
conversation_entity_score = []
conversation_entity_word = []
```

### 5/ Batch Processing: Generate 500 responses per batch from API

Here are advantages why I split the dataset into batches to run the job more effienctly:

- Starts a pool of compute VMs for you.

- Installs applications and staging data.

- Runs jobs with as many tasks as I have.

- Identifies failures.

- Requeues work.

- Scales down the pool as work completes.

```
import requests
import json

url = 'http://nni.cot.ai:19721/query'

my_object = []
for i, (id, m) in tqdm(enumerate(zip(object_ids, object_messages)), total = len(object_ids)): 
    temp = {
        "reference_id": int(id),
        "text": m
    }
    my_object.append(temp)
    if (i+1) % 500 == 0 or i == len(object_ids) - 1: # 2 cases: divisible (to get batches of 500 rows) or last iteration (the last batch with less than 500 rows)
        response = requests.post(url, json = my_object)
        my_object = []        
        for item in response.json(): # loop through each result in the my_object batch of 1000 rows
            #print(item)

            # Intention
            conversation_intention_conversation_id.append(item['reference_id'])
            # Append the reference_id of the chat line, the customer's most possible intention (intent), the customer's intention highest score
            conversation_intention_label.append(item['intent'][0]['label'])
            conversation_intention_score.append(item['intent'][0]['score'])     

            # Entities
            for ent in item['entities']: # An empty entity will be ignored and moved on
                conversation_entities_conversation_id.append(item['reference_id'])
                conversation_entity.append(ent['entity']) # get all entities so they wiil have duplicate ref_id. That's why they must have Conversation Entities IDs
                conversation_entity_score.append(ent['score']) 
                conversation_entity_word.append(ent['word'])
```

### 6/ Plug all 7 lists into the Conversation Intention & Entities's data frames
```
df_Conversation_Entities = pd.DataFrame(np.column_stack([conversation_intention_conversation_id, conversation_entity, conversation_entity_score, conversation_entity_word]), 
                               columns=['Conversation_ID', 'Conversation_Entity', 'Conversation_Entity_Score', 'Conversation_Entity_Word'])
```

```
df_Conversation_Intention = pd.DataFrame(np.column_stack([conversation_intention_conversation_id, conversation_intention_label, conversation_intention_score]), 
                               columns=['Conversation_ID', 'Intention_Label', 'Intention_Score'])
```

### 7/ Save the Conversation Intention & Entities for Visualization in Tableau
```
df_Conversation_Intention.to_csv('C:\Programming\CustomerIntention\src\data\Conversation_Intention.csv', encoding='utf-8')
```

```
df_Conversation_Entities.to_csv('C:\Programming\CustomerIntention\src\data\Conversation_Entities.csv', encoding='utf-8')
```

## B. Insert all rows of each dataframe to database's tables in TablePlus

New Method: inserting directly from data frames

Inserting takes long time means that selecting or filtering will take less time, and in reverse, due to adding IDX for a column or different columns depending on purposes of saving data into relational database only or reading the data.

We will insert dataframes in batches into session (relational database), then commit to finalize saving. If an error happen, that batch will be stopped inserting and still stay in the session and other batches will not be entered into the session as well if flush() is placed outside 'for loop'. Therefore, if flush() is placed inside the for loop, batches will be flushed into the session regarless any error might occur. But we have to set rollback() in the except case to delete any existing batches in the session causing an error.

### Insert 'df_Conversation' dataframe into 'conversation' database

```
import time
#import mysql.connector # as below mysql, not sqlite3 for this case
import traceback
from tqdm import tqdm
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String,  create_engine # use sqlalchemy with connection string for mysql
from sqlalchemy.orm import scoped_session, sessionmaker
import unicodedata 

Base = declarative_base()
DBSession = scoped_session(sessionmaker()) # the scoped_session() function is provided which produces a thread-managed registry of Session objects. It is commonly used in web applications so that a single global variable can be used to safely represent transactional sessions with sets of objects, localized to a single thread.
engine = None

def init_sqlalchemy(dbname='mysql+mysqldb://phuongdaingo:0505@localhost:3306/customerintention?charset=utf8mb4'):
    global engine
    engine = create_engine(dbname, echo=False)
    DBSession.remove()
    DBSession.configure(bind=engine, autoflush=False, expire_on_commit=False)
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)

def conversation_sqlalchemy_orm(n=100000): 
    init_sqlalchemy()
    t0 = time.time() 
    error_i_list = [] # a new list containing i(s) of batch(es) causing errors
    # Index column must match with ID column of df_Conversation  > indexing to the row 10th iso using loop with iterows (time consuming), but by using range(df.rows) > take out the 10th row
    for i in tqdm(range(n)): # use tqdm to track progress 
        try: # create custome, then add into session
            conversation = Conversation()
            conversation.order = df_Conversation['Order'].iloc[i]
            conversation.sender = df_Conversation['Sender'].iloc[i]
            conversation.message = unicodedata.normalize('NFC', str(df_Conversation['Message'].iloc[i]).encode("utf-8").decode("utf-8"))
            conversation.fan_page_id = int(df_Conversation['Fanpage'].iloc[i]) # recreate the DB
            conversation.cus_id = df_Conversation['PSID'].iloc[i] 
            DBSession.add(conversation) # error might happen here or below
            DBSession.commit()
            
            if i % 1000 == 0: # when i reachs 1000 rows, it will execute by flush() to insert the batch of 1000 rows into the session of the relational database
                DBSession.flush() # should use try, except inside each 'for loop' to wrap i # error might happen here
                DBSession.commit() #2nd attempt: place commit() here, then compare the progress # commit here to insert batch without affecting other batch(es) with errors
                #text = unicodedata.normalize('NFC', text) # text: string type to fix error and replace all string texts into being wrapped by unicode 
                
        except Exception as er:
            print('Error at index {}: '.format(i))
            print(traceback.format_exc()) # print error(s)
            print('-' * 20)
            DBSession.rollback() # rollback here to delete all rows of a batch/batches causing errors to avoid being flooded or stuck with new batches coming in and then getting stuck as well
            error_i_list.append(i) # append into array the index of batch(es) causing errors 
   # DBSession.commit()  # 1st attempt: place commit() here, outside of 'for loop' # faster but will stop other batches coming in if errors happen
    
    print(
        "Conversation's SQLAlchemy ORM: Total time for " + str(n) +
        " records " + str(time.time() - t0) + " secs")

    # A new function to select rows from conversations with a condition filtering by cus_id, joining with table 'customer' to return the cus_name
#def join_tables():

if __name__ == '__main__':
    #conversation_sqlalchemy_orm(df_Conversation.shape[0]) # number of rows of df as I want --> customized function name
    conversation_sqlalchemy_orm(df_Conversation.shape[0])
```

### Insert 'df_Conversation_Information' dataframe into 'conversation_information' database

There will be an Error at index 260000 due to Duplicate entry '250001' for key 'IDX_conversation_id' so I have to delete this IDX of Conversation ID in the MYSQL by creating a new table for Conversation there.

```
import time
#import mysql.connector # as below mysql, not sqlite3 for this case
import traceback
from tqdm import tqdm
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String,  create_engine # use sqlalchemy with connection string for mysql
from sqlalchemy.orm import scoped_session, sessionmaker

Base = declarative_base()
DBSession = scoped_session(sessionmaker()) # the scoped_session() function is provided which produces a thread-managed registry of Session objects. It is commonly used in web applications so that a single global variable can be used to safely represent transactional sessions with sets of objects, localized to a single thread.
engine = None

def init_sqlalchemy(dbname='mysql+mysqldb://phuongdaingo:0505@localhost:3306/customerintention?charset=utf8mb4'):
    global engine
    engine = create_engine(dbname, echo=False)
    DBSession.remove()
    DBSession.configure(bind=engine, autoflush=False, expire_on_commit=False)
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)

def conversation_information_sqlalchemy_orm(n=100000): 
    init_sqlalchemy()
    t0 = time.time() 
    error_i_list = [] # a new list containing i(s) of batch(es) causing errors
    # Index column must match with ID column of df_Conversation  > indexing to the row 10th iso using loop with iterows (time consuming), but by using range(df.rows) > take out the 10th row
    for i in tqdm(range(n)): # use tqdm to track progress 
        try: # create custome, then add into session
            conversation_information = Conversation_Information()
            conversation_information.conversation_id = df_Conversation_Information['Conversation_ID'].iloc[i]
            conversation_information.customer_count = df_Conversation_Information['CustomerCount'].iloc[i]
            conversation_information.sales_count = df_Conversation_Information['SalesCount'].iloc[i]
            conversation_information.start_time = df_Conversation_Information['StartTime'].iloc[i] # google, insert 1 row only for trial
            conversation_information.end_time = df_Conversation_Information['EndTime'].iloc[i]
            
            DBSession.add(conversation_information) # error might happen here or below
            if i % 10000 == 0: # when i reachs 1000 rows, it will execute by flush() to insert the batch of 1000 rows into the session of the relational database
                DBSession.flush() # should use try, except inside each 'for loop' to wrap i # error might happen here
                DBSession.commit() #2nd attempt: place commit() here, then compare the progress # commit here to insert batch without affecting other batch(es) with errors
        except Exception as er:
            print('Error at index {}: '.format(i))
            print(traceback.format_exc()) # print error(s)
            print('-' * 20)
            DBSession.rollback() # rollback here to delete all rows of a batch/batches causing errors to avoid being flooded or stuck with new batches coming in and then getting stuck as well
            error_i_list.append(i) # append into array the index of batch(es) causing errors 
   # DBSession.commit()  # 1st attempt: place commit() here, outside of 'for loop' # faster but will stop other batches coming in if errors happen
    
    print(
        "Conversation_Information's SQLAlchemy ORM: Total time for " + str(n) +
        " records " + str(time.time() - t0) + " secs")

    # A new function to select rows from conversations with a condition filtering by cus_id, joining with table 'customer' to return the cus_name
#def join_tables():

if __name__ == '__main__':
    conversation_information_sqlalchemy_orm(df_Conversation_Information.shape[0]) # number of rows of df as I want --> customized function name
```

### Insert 'df_Fan_Page' dataframe into 'fan_page' database

```
import time
#import mysql.connector # as below mysql, not sqlite3 for this case
import traceback
from tqdm import tqdm
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String,  create_engine # use sqlalchemy with connection string for mysql
from sqlalchemy.orm import scoped_session, sessionmaker
import unicodedata 

Base = declarative_base()
DBSession = scoped_session(sessionmaker()) # the scoped_session() function is provided which produces a thread-managed registry of Session objects. It is commonly used in web applications so that a single global variable can be used to safely represent transactional sessions with sets of objects, localized to a single thread.
engine = None

def init_sqlalchemy(dbname='mysql+mysqldb://phuongdaingo:0505@localhost:3306/customerintention?charset=utf8mb4'):
    global engine
    engine = create_engine(dbname, echo=False)
    DBSession.remove()
    DBSession.configure(bind=engine, autoflush=False, expire_on_commit=False)
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
    
def fan_page_sqlalchemy_orm(n=100000): 
    init_sqlalchemy()
    t0 = time.time() 
    error_i_list = [] # a new list containing i(s) of batch(es) causing errors
    # Index column must match with ID column of df_Conversation  > indexing to the row 10th iso using loop with iterows (time consuming), but by using range(df.rows) > take out the 10th row
    for i in tqdm(range(n)): # use tqdm to track progress 
        try: # create custome, then add into session
            fan_page = Fan_Page()
            fan_page.fan_page_name = unicodedata.normalize('NFC', str(df_Fan_Page['FanpageName'].iloc[i]).encode("utf-8").decode("utf-8"))
            fan_page.fan_page_id = df_Fan_Page['Fanpage'].iloc[i]
            #fan_page.start_time = df_Fan_Page['StartTime'].iloc[i] # google, insert 1 row only for trial
            #fan_page.end_time =  df_Fan_Page['EndTime'].iloc[i]
            
            DBSession.add(fan_page) # error might happen here or below
            if i % 10000 == 0: # when i reachs 1000 rows, it will execute by flush() to insert the batch of 1000 rows into the session of the relational database
                DBSession.flush() # should use try, except inside each 'for loop' to wrap i # error might happen here
                DBSession.commit() #2nd attempt: place commit() here, then compare the progress # commit here to insert batch without affecting other batch(es) with errors
        except Exception as er:
            print('Error at index {}: '.format(i))
            print(traceback.format_exc()) # print error(s)
            print('-' * 20)
            DBSession.rollback() # rollback here to delete all rows of a batch/batches causing errors to avoid being flooded or stuck with new batches coming in and then getting stuck as well
            error_i_list.append(i) # append into array the index of batch(es) causing errors 
   # DBSession.commit()  # 1st attempt: place commit() here, outside of 'for loop' # faster but will stop other batches coming in if errors happen
    
    print(
        "Fan_Page's SQLAlchemy ORM: Total time for " + str(n) +
        " records " + str(time.time() - t0) + " secs")

    # A new function to select rows from conversations with a condition filtering by cus_id, joining with table 'customer' to return the cus_name
#def join_tables():

if __name__ == '__main__':
    fan_page_sqlalchemy_orm(df_Fan_Page.shape[0]) # number of rows of df as I want --> customized function name
```

### Insert 'df_Customer' dataframe into 'customer' database

```
import time
#import mysql.connector # as below mysql, not sqlite3 for this case
import traceback
from tqdm import tqdm
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String,  create_engine # use sqlalchemy with connection string for mysql
from sqlalchemy.orm import scoped_session, sessionmaker
import unicodedata 

Base = declarative_base()
DBSession = scoped_session(sessionmaker()) # the scoped_session() function is provided which produces a thread-managed registry of Session objects. It is commonly used in web applications so that a single global variable can be used to safely represent transactional sessions with sets of objects, localized to a single thread.
engine = None

def init_sqlalchemy(dbname='mysql+mysqldb://phuongdaingo:0505@localhost:3306/customerintention?charset=utf8mb4'):
    global engine
    engine = create_engine(dbname, echo=False)
    DBSession.remove()
    DBSession.configure(bind=engine, autoflush=False, expire_on_commit=False)
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)

def customer_sqlalchemy_orm(n=100000): 
    init_sqlalchemy()
    t0 = time.time() 
    error_i_list = [] # a new list containing i(s) of batch(es) causing errors
    # index column must match with ID column of df_Customer  > indexing to the row 10th iso using loop with iterows (time consuming), but by using range(df.rows) > take out the 10th row
    for i in tqdm(range(n)): # use tqdm to track progress 
        try: # create custome, then add into session
            customer = Customer()
            customer.cus_name = unicodedata.normalize('NFC', str(df_Customer['CusName'].iloc[i]).encode("utf-8").decode("utf-8")) # Use rows from dataframe to insert them into the relational databse, not insert the self-created rows
            #customer.cus_name = df_Customer['CusName'].iloc[i]
            customer.cus_id = df_Customer['PSID'].iloc[i]
            DBSession.add(customer) # error might happen here or below
            DBSession.commit()
            if i % 10000 == 0: # when i reachs 10000 rows, it will execute by flush() to insert the batch of 1000 rows into the session of the relational database
                DBSession.flush() # should use try, except inside each 'for loop' to wrap i # error might happen here
                DBSession.commit() #2nd attempt: place commit() here, then compare the progress # commit here to insert batch without affecting other batch(es) with errors
        except Exception as er:
            print('Error at index {}: '.format(i))
            print(traceback.format_exc()) # print error(s)
            print('-' * 20)
            DBSession.rollback() # rollback here to delete all rows of a batch/batches causing errors to avoid being flooded or stuck with new batches coming in and then getting stuck as well
            error_i_list.append(i) # append into array the index of batch(es) causing errors 
    #DBSession.commit()  # 1st attempt: place commit() here, outside of 'for loop' # faster but will stop other batches coming in if errors happen
    
    print(
        "Customer's SQLAlchemy ORM: Total time for " + str(n) +
        " records " + str(time.time() - t0) + " secs")

    # A new function to select rows from conversations with a condition filtering by cus_id, joining with table 'customer' to return the cus_name
#def join_tables():

if __name__ == '__main__':
    #customer_sqlalchemy_orm(df_Customer.shape[0]) # number of rows of df as I want --> customized function name
    customer_sqlalchemy_orm(df_Customer.shape[0])
```

### Insert 'Conversation_Intention' dataframe into 'conversation_intention' database

```
import time
#import mysql.connector # as below mysql, not sqlite3 for this case
import traceback
from tqdm import tqdm
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String,  create_engine # use sqlalchemy with connection string for mysql
from sqlalchemy.orm import scoped_session, sessionmaker
import unicodedata 

Base = declarative_base()
DBSession = scoped_session(sessionmaker()) # the scoped_session() function is provided which produces a thread-managed registry of Session objects. It is commonly used in web applications so that a single global variable can be used to safely represent transactional sessions with sets of objects, localized to a single thread.
engine = None

def init_sqlalchemy(dbname='mysql+mysqldb://phuongdaingo:0505@localhost:3306/customerintention?charset=utf8mb4'):
    global engine
    engine = create_engine(dbname, echo=False)
    DBSession.remove()
    DBSession.configure(bind=engine, autoflush=False, expire_on_commit=False)
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
    
def conversation_intention_sqlalchemy_orm(n=100000): 
    init_sqlalchemy()
    t0 = time.time() 
    error_i_list = [] # a new list containing i(s) of batch(es) causing errors
    # Index column must match with ID column of df_Conversation  > indexing to the row 10th iso using loop with iterows (time consuming), but by using range(df.rows) > take out the 10th row
    for i in tqdm(range(n)): # use tqdm to track progress 
        try: # create custome, then add into session
            conversation_intention = Conversation_Intention()
            conversation_intention.reference_id = df_Conversation_Intention['Conversation_ID'].iloc[i]
            conversation_intention.intention_label = unicodedata.normalize('NFC', str(df_Conversation_Intention['Intention_Label'].iloc[i]).encode("utf-8").decode("utf-8"))
            conversation_intention.intention_score = df_Conversation_Intention['Fanpage'].iloc[i]
            
            DBSession.add(conversation_intention) # error might happen here or below
            if i % 10000 == 0: # when i reachs 1000 rows, it will execute by flush() to insert the batch of 1000 rows into the session of the relational database
                DBSession.flush() # should use try, except inside each 'for loop' to wrap i # error might happen here
                DBSession.commit() #2nd attempt: place commit() here, then compare the progress # commit here to insert batch without affecting other batch(es) with errors
        except Exception as er:
            print('Error at index {}: '.format(i))
            print(traceback.format_exc()) # print error(s)
            print('-' * 20)
            DBSession.rollback() # rollback here to delete all rows of a batch/batches causing errors to avoid being flooded or stuck with new batches coming in and then getting stuck as well
            error_i_list.append(i) # append into array the index of batch(es) causing errors 
   # DBSession.commit()  # 1st attempt: place commit() here, outside of 'for loop' # faster but will stop other batches coming in if errors happen
    
    print(
        "Conversation_Intention's SQLAlchemy ORM: Total time for " + str(n) +
        " records " + str(time.time() - t0) + " secs")

    # A new function to select rows from conversations with a condition filtering by cus_id, joining with table 'customer' to return the cus_name
#def join_tables():

if __name__ == '__main__':
    conversation_intention_sqlalchemy_orm(df_Conversation_Intention.shape[0]) # number of rows of df as I want --> customized function name
```

### Insert 'Conversation_Entities' dataframe into 'conversation_entities' database

```
import time
#import mysql.connector # as below mysql, not sqlite3 for this case
import traceback
from tqdm import tqdm
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String,  create_engine # use sqlalchemy with connection string for mysql
from sqlalchemy.orm import scoped_session, sessionmaker
import unicodedata 

Base = declarative_base()
DBSession = scoped_session(sessionmaker()) # the scoped_session() function is provided which produces a thread-managed registry of Session objects. It is commonly used in web applications so that a single global variable can be used to safely represent transactional sessions with sets of objects, localized to a single thread.
engine = None

def init_sqlalchemy(dbname='mysql+mysqldb://phuongdaingo:0505@localhost:3306/customerintention?charset=utf8mb4'):
    global engine
    engine = create_engine(dbname, echo=False)
    DBSession.remove()
    DBSession.configure(bind=engine, autoflush=False, expire_on_commit=False)
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
    
def conversation_entities_sqlalchemy_orm(n=100000): 
    init_sqlalchemy()
    t0 = time.time() 
    error_i_list = [] # a new list containing i(s) of batch(es) causing errors
    # Index column must match with ID column of df_Conversation  > indexing to the row 10th iso using loop with iterows (time consuming), but by using range(df.rows) > take out the 10th row
    for i in tqdm(range(n)): # use tqdm to track progress 
        try: # create custome, then add into session
            conversation_entities = Conversation_Entities()
            conversation_entities.reference_id = df_Conversation_Entities['Conversation_ID'].iloc[i]
            conversation_entities.conversation_entity = unicodedata.normalize('NFC', str(df_Conversation_Entities['Conversation_Entity'].iloc[i]).encode("utf-8").decode("utf-8"))
            conversation_entities.conversation_entity_score = df_Conversation_Entities['Conversation_Entity_Score'].iloc[i]
            conversation_entities.conversation_entity_word = unicodedata.normalize('NFC', str(df_Conversation_Entities['Conversation_Entity_word'].iloc[i]).encode("utf-8").decode("utf-8"))

            
            DBSession.add(conversation_entities) # error might happen here or below
            if i % 10000 == 0: # when i reachs 1000 rows, it will execute by flush() to insert the batch of 1000 rows into the session of the relational database
                DBSession.flush() # should use try, except inside each 'for loop' to wrap i # error might happen here
                DBSession.commit() #2nd attempt: place commit() here, then compare the progress # commit here to insert batch without affecting other batch(es) with errors
        except Exception as er:
            print('Error at index {}: '.format(i))
            print(traceback.format_exc()) # print error(s)
            print('-' * 20)
            DBSession.rollback() # rollback here to delete all rows of a batch/batches causing errors to avoid being flooded or stuck with new batches coming in and then getting stuck as well
            error_i_list.append(i) # append into array the index of batch(es) causing errors 
   # DBSession.commit()  # 1st attempt: place commit() here, outside of 'for loop' # faster but will stop other batches coming in if errors happen
    
    print(
        "Conversation_Entities's SQLAlchemy ORM: Total time for " + str(n) +
        " records " + str(time.time() - t0) + " secs")

    # A new function to select rows from conversations with a condition filtering by cus_id, joining with table 'customer' to return the cus_name
#def join_tables():

if __name__ == '__main__':
    conversation_entities_sqlalchemy_orm(df_Conversation_Entities.shape[0]) # number of rows of df as I want --> customized function name
```

#### Select, Filter - Using query on session with joining method

Reference: 

https://www.tutorialspoint.com/sqlalchemy/sqlalchemy_orm_working_with_joins.htm

https://docs.sqlalchemy.org/en/14/orm/query.html

##### Filter the Conversation
```
stmt = session.query(Conversation).filter(Conversation.order == 0).all() #first(): get the first or all(): get all
for val in stmt:
    print(val.message)
    print(val.order)
    print(val.sender)
```
```
stmt_Conversation = session.query(Conversation).join(Fan_Page.fan_page_id).filter(Conversation.order == 0).all() #first(): get the first or all(): get all
for val in stmt_Conversation:
    print(val.message)
    print(val.order)
    print(val.sender)
```

##### Filter the Conversation_Information
```
stmt = session.query(Conversation_Information).filter(Conversation_Information.conversation_id == 0).first() #first(): get the first or all(): get all
#for val in stmt:
    #print(val.conversation_id)
    #print(val.customer_count)
    #print(val.sales_count)
print(stmt.conversation_id)
print(stmt.customer_count)
print(stmt.sales_count)
```

Reference: https://stackoverflow.com/questions/51451768/sqlalchemy-querying-with-datetime-columns-to-filter-by-month-day-year

```
stmt = session.query(Conversation_Information).filter(Conversation_Information.start_time == '2019-11-03'
                                                     ).all() #first(): get the first or all(): get all
#for val in stmt:
    #print(val.conversation_id)
    #print(val.customer_count)
    #print(val.sales_count)
print(stmt.conversation_id)
print(stmt.customer_count)
print(stmt.sales_count)
```
```
stmt_Conversation_Info = session.query(Conversation_Information).join(Conversation.id).limit(5).filter(Conversation_Information.conversation_id == 0).all() #first(): get the first or all(): get all
for val in stmt_Conversation_Info:
    print(val.conversation_id)
    print(val.customer_count)
    print(val.sales_count)
```
 
##### Filter the Customer

```
stmt = session.query(Customer).filter(Customer.cus_name == 'Simon').first() #first(): get the first or all(): get all
print(stmt.cus_id)
print(stmt.cus_name)
print(stmt.id)
def filter_Customer_name(name)
    stmt = session.query(Customer).filter(Customer.cus_name == name).first() #first(): get the first or all(): get all
    for val in stmt:
        print(val.cus_id)
        print(val.cus_name)
        print(val.id)
filter_Customer_name('TTTT') # this should be a certain customer name.
```
```
stmt_Customer = session.query(Customer).join(Conversation.id).filter(Customer.cus_name == 'Simon').first() #first(): get the first or all(): get all
for val in stmt_Customer:
    print(val.cus_id)
    print(val.cus_name)
    print(val.message)
```

##### Filter the Fan_Page
```
stmt = session.query(Fan_Page).filter(Fan_Page.fan_page_name == 'Simon').all() #first(): get the first or all(): get all
for val in stmt:
    print(val.fan_page_name)
    print(val.fan_page_id)
def filter_Fan_Page_name(name)    
    stmt = session.query(Fan_Page).filter(Fan_Page.fan_page_name == name).all() #first(): get the first or all(): get all
    for val in stmt:
        print(val.fan_page_name)
        print(val.fan_page_id)
filter_Fan_Page_name('HB') # this should be a certain fan page name
```
```
stmt_Fan_Page = session.query(Fan_Page).filter(Fan_Page.fan_page_name == 'Simon').all() #first(): get the first or all(): get all
for val in stmt_Fan_Page:
    print(val.fan_page_name)
    print(val.fan_page_id)
    print(val.message)
```

#### Select, Filter with data directly created in the MySQL Relational Database

##### Filter by query Conversation
```
stmt = session.query(Conversation).filter(Conversation.order == 0).all() #first(): get the first or all(): get all
for val in stmt:
    print(val.message)
    print(val.order)
    print(val.sender)
```

##### Filter by query Conversation_Information
```
stmt = session.query(Conversation_Information).filter(Conversation_Information.conversation_id == 0).first() #first(): get the first or all(): get all
#for val in stmt:
    #print(val.conversation_id)
    #print(val.customer_count)
    #print(val.sales_count)
print(stmt.conversation_id)
print(stmt.customer_count)
print(stmt.sales_count)
```

#####  Filter by query Customer
```
stmt = session.query(Customer).filter(Customer.cus_name == 'Frank').first() #first(): get the first or all(): get all
print(stmt.cus_id)
print(stmt.cus_name)
print(stmt.id)
```
```
stmt = session.query(Customer).filter(Customer.cus_id % 2 == 0).all()
for val in stmt:
    print(val.cus_name)
```

##### Filter by query Fan_Page
```
stmt = session.query(Fan_Page).filter(Fan_Page.fan_page_name == 'ABC').all() #first(): get the first or all(): get all
for val in stmt:
    print(val.fan_page_name)
    print(val.fan_page_id)
```

# **`Data Modelling:`**

The UNIQUE KEY statement is used to create indexes in tables. So, let's come to theories applied to our project case.

1/ What is INDEX in SQL? Pros and cons of using INDEX?

An index (INDEX) in SQL is a special table lookup that a database search engine can use to increase data retrieval times and performance.

Simply, an entry is a pointer to each value that appears in the indexed table/column. Indexes in a Database have a meaningful similarity to entries in a book's Table of Contents.

INDEX speeds up SELECT queries containing WHERE or ORDER entries, but it slows down data entry with UPDATE and INSERT commands. Indexes can be created or deleted without affecting the data.

INDEX in SQL is a specialized lookup table to improve search speed and data query efficiency. An entry is a pointer to each value that appears in the indexed table/column. Indexces in a database have a meaningful similarity to entries in a book's Table of Contents.
INDEX speeds up SELECT queries containing WHERE or ORDER entries, but it slows down data entry with UPDATE and INSERT commands. Indexes can be created or deleted without affecting the data.

2/ What are PKs, FKs in our case?

The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables. A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table. The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.
So in our case, the 4 below tables has their primary keys as ‘id’ but each has different Foreign keys pointing to the main sales dataframe’s columns, for examples:

- conversation: ‘message’ pointing to the main sales dataframe’s column ‘Message’

- conversation_information: ‘conversation_id’, ‘customer_count’, ‘sales_count’, ‘start_time’, ‘end_time’ pointing to the  main sales dataframe’s columns: PSID, CustomerCount, SalesCount, StartTime, EndTime

- fan_page: ‘fan_page_name’ (pointing to the ‘FanpageName’), ‘fan_page_id’ (pointing to the ‘Fanpage’)

- customer: ‘cus_name’ (pointing to the ‘CusName’), cus_id (pointing to the ‘PSID’)

- conversation_intention: ‘conversation_id’ (pointing to the ‘Conversation’)

- conversation_entities: ‘conversation_id’ (pointing to the ‘Conversation’)

The benefit of analyzing the metadata is that we can clearly identify data inconsistences with our dataset.

```
CREATE TABLE `conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fan_page_id` int(30) NOT NULL,
  `fan_page_name` varchar(255) NOT NULL,
  `cus_id` int(30) NOT NULL,
  `cus_name` varchar(50) NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `message_ID` int(11) NOT NULL,
  `sender` int(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100131 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci


CREATE TABLE `conversation_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  --`conversation_id` int(11) NOT NULL, -- removed
  `customer_count` int(11) NOT NULL,
  `sales_count` int(11) NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_conversation_id` (`conversation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(50) NOT NULL,
  `cus_id` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_cus_name` (`cus_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2982 DEFAULT CHARSET=utf8

CREATE TABLE `fan_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fan_page_name` varchar(255) NOT NULL,
  `fan_page_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_fan_page_name` (`fan_page_name`) USING BTREE,
  UNIQUE KEY `IDX_fan_page_id` (`fan_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `conversation_intention` (
  `conversation_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` bigint(20) NOT NULL,
  `intention` varchar(20) CHARACTER SET utf8 NOT NULL,
  `score` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_reference_id` (`reference_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci

CREATE TABLE `converstion_entities` (
  `conversation_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` bigint(20) NOT NULL,
  `conversation_entity` varchar(20) CHARACTER SET utf8 NOT NULL,
  `conversation_entity_score` float NOT NULL,
  `conversation_entity_string` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_reference_id` (`reference_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
```

# **`Data Analysis:`**

## Analysis in SQL:

### 1/ Count Fan Page name
```
SELECT c.fan_page_name, COUNT(c.fan_page_name)
FROM conversation as c 
GROUP BY c.fan_page_name
ORDER BY c.fan_page_name DESC 
LIMIT 10;
```
### 2/ Fan Page contacted by Hour
```
SELECT fp.fan_page_name, HOUR(ci.start_time), COUNT(c.fan_page_name)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN fan_page AS fp 
ON c.group_id = fp.fan_page_id
GROUP BY fp.fan_page_name
ORDER BY HOUR(ci.start_time) ASC, COUNT(c.fan_page_name) DESC
```

### 3/ Total Chat by Cus ID & Cus Name
```
SELECT cus.cus_name, SUM(ci.customer_count)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN customer AS cus 
ON c.cus_id = cus.cus_id
GROUP BY cus.cus_
ORDER BY SUM(ci.customer_count)
LIMIT 50;
```
### 4/ Customer Chats by Hour
```
SELECT HOUR(ci.start_time), COUNT(ci.customer_count) 
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN customer AS cus 
ON c.cus_id = cus.cus_id
GROUP BY HOUR(ci.start_time)
ORDER BY HOUR(ci.start_time) ASC;
```
### 5/ Count of Intention by Fan Page
```
SELECT fp.fan_page_name, cui.intention_label, COUNT(cui.intention_label)
FROM fan_page AS fp 
INNER JOIN conversation AS c 
ON fp.fan_page_id = c.fan_page_id
INNER JOIN customer_intention AS cui 
ON c.group_id = cui.conversation_id 
GROUP BY fp.fan_page_name, cui.intention_label
ORDER BY COUNT(cui.intention_label) DESC; 
```
### 6/ Top 10 Intentions by 2019
```
SELECT YEAR(ci.start_time), MONTH(ci.start_time), cui.intention_label, COUNT(cui.intention_label)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN conversation_intention AS cui 
ON cui.conversation_id = c.group_id 
WHERE YEAR(ci.start_time) = 2019
GROUP BY MONTH(ci.start_time)
ORDER BY COUNT(cui.intention_label) DESC
LIMIT 10;
```
### 7/ Top 10 Intentions by 2020
```
SELECT YEAR(ci.start_time), MONTH(ci.start_time), cui.intention_label, COUNT(cui.intention_label)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN conversation_intention AS cui 
ON cui.conversation_id = c.group_id 
WHERE YEAR(ci.start_time) = 2020
GROUP BY MONTH(ci.start_time)
ORDER BY COUNT(cui.intention_label) DESC
LIMIT 10;
```
### 8/ Top Intentions
```
SELECT cui.intention_label, COUNT(cui.intention_label)
FROM conversation_intention AS CUI 
ORDER BY COUNT(cui.intention_label);
```
### 9/ Top Entities
```
SELECT ce.entities_label, COUNT(ce.entities_label), COUNT(ce.entities_label) / SUM(ce.entities_label) * 100 AS weightage
FROM conversation_entities AS ce 
ORDER BY COUNT(ce.entities_label) DESC;
```
### 10/ Top 10 Entities by 2019
```
SELECT YEAR(ci.start_time), MONTH(ci.start_time), ce.entities_label, COUNT(ce.entities_label)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN conversation_entities AS ce 
ON ce.conversation_id = c.group_id  
WHERE YEAR(ci.start_time) = 2019
GROUP BY MONTH(ci.start_time)
ORDER BY COUNT(ce.entities_label) DESC
LIMIT 10;
```
### 11/ Top 10 Entities by 2020
```
SELECT YEAR(ci.start_time), MONTH(ci.start_time), ce.entities_label, COUNT(ce.entities_label)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN conversation_entities AS ce 
ON ce.conversation_id = c.group_id  
WHERE YEAR(ci.start_time) = 2020
GROUP BY MONTH(ci.start_time)
ORDER BY COUNT(ce.entities_label) DESC
LIMIT 10;
```
### 12/ Count of Intention - Transaction by Customer Name
```
SELECT cus.cus_id, cus.cus_name, cui.intention_label, COUNT(cui.intention_label)
FROM conversation_intention AS cui 
INNER JOIN conversation AS c 
ON cui.conversation_id = c.group_id
INNER JOIN customer AS cus 
ON c.cus_id = cus.cus_id
WHERE cui.intention_label = "Transaction - Achat" OR cui.intention_label = "Transaction - Expédition d'un autre jour"
GROUP BY cus.cus_id, cus.cus_name 
ORDER BY COUNT(cui.intention_label) DESC;
```
### 13/ Interaction between Customer & Sales by Top 20 Fan Pages
```
SELECT fp.fan_page_name, ci.cus_count, SUM(ci.cus_count), ci.sales_count, SUM(ci.sales_count)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN fan_page AS fp 
ON c.group_id = fp.fan_page_id
GROUP BY fp.fan_page_name, ci.cus_count, ci.sales_count
ORDER BY SUM(ci.cus_count), SUM(ci.sales_count) DESC 
LIMIT 20;
```
### 14/ Cus Count vs Sales Count by Hour
```
SELECT HOUR(ci.start_time), ci.cus_count, COUNT(DISTINCT(ci.cus_count)), ci.sales_count, COUNT(DISTINCT(ci.sales_count))
FROM conversation_information AS ci 
GROUP BY HOUR(ci.start_time), ci.cus_count, ci.sales_count
ORDER BY HOUR(ci.start_time) ASC;
```
### 15/ Most Complaining Customers
```
SELECT cus.psid, cus.cus_name, COUNT(cui.intention_label)
FROM customer AS cus  
INNER JOIN conversation AS c 
ON cus.cus_id = c.cus_id
INNER JOIN conversation_intention AS cui 
ON cui.conversation_id = c.group_id 
WHERE cui.intention_label = "Complaint - Prix" 
OR cui.intention_label = "Complaint - Livraison manquante"
OR cui.intention_label = "Complaint - Réponse lente"
OR cui.intention_label = "Complaint - Perturbation"
OR cui.intention_label = "Complaint - Délai de livraison"
GROUP BY cus.psid, cus.cus_name, cui.intention_label
ORDER BY COUNT(cui.intention_label) DESC;
```
### 16/ % Intentions by Customers with selected of Intentions
```
SELECT cus.psid, cus.cus_name, cui.intention_label, COUNT(cui.intention_label) / SUM(cui.intention_label) * 100 as intention_percentage
FROM customer AS cus  
INNER JOIN conversation AS c 
ON cus.cus_id = c.cus_id
INNER JOIN conversation_intention AS cui 
ON cui.conversation_id = c.group_id 
WHERE cui.intention_label = "Complaint - Prix" 
OR cui.intention_label = "Complaint - Livraison manquante"
OR cui.intention_label = "Complaint - Réponse lente"
OR cui.intention_label = "Complaint - Perturbation"
OR cui.intention_label = "Complaint - Délai de livraison"
OR cui.intention_label = "Transaction - Achat" 
OR cui.intention_label = "Transaction - Expédition d'un autre jour"
GROUP BY cus.psid, cus.cus_name, cui.intention_label
ORDER BY COUNT(cui.intention_label) DESC;
```

## Visualization on Tableau:

Notes: 

Sum – Returns the sum of the numbers in a measure. Null values are ignored.

Count – Returns the number of rows in a measure or a dimension. When applied to a dimension, Tableau creates a new temporary column that is a measure because the result of a count is a number. You can count numbers, dates, Booleans, and strings. Null values are ignored in all cases.

Count Distinct – Returns the number of unique values in a measure or dimension. When applied to a dimension, Tableau creates a new temporary column that is a measure because the result of a count is a number. You can count numbers, dates, Booleans, and strings. Null values are ignored in all cases.

### 1/ Fan Page:

https://public.tableau.com/app/profile/dai.phuong.ngo/viz/SentimentAnalysis-DashboardFanPages/DashboardFanPage

![](https://i.imgur.com/V5aSlLf.jpg)

Observing the **`Most Visted Fan Pages`**, *`Fan Page 44`* and *`Fan Page 27`* played significant roles online as they had the most visits of over 800K visits. 

As drawn up by the **`Interaction between Customers & Sales of Top 20 Fan Pages`**, in the one hand, *`Fan Page 22`* has a quite equal chats between Customers and Salespersons. In the other hand, *`Fan Page 44`*'s Salespersons accounted for more chats than the Customers in all Conversations.

In relation to the **`Top Fan Page contacted by Hour`**, The top 2 visited Fan Pages by hour over the day are still Fan Page 44 and Fan Page 27. The 2 peak time that customers visited all Fan Pages the most were at *`7 AM and 1 PM`*. This is probably because they were about leaving for work and having lunch break so they could have free time to visit and chat. The lowest points were at 10 AM (probably when they fully concentrated at work or being out for grocery or preparing lunch) and from 3 - 9 PM. The afternoon might be busy for them to finish the work as soon as possible, pick up kids from school, prepare for dinner, clean up after dinner, spend time with family in the evening, relax and chill before bed time from 10 PM onwards. Then, they might have some free time to visit and chat before sleepping.

Therefore, having an available Sales team to listen and talk to customers via Fan Page chat at those peak hours could be beneficial and informative for them and having the Sales team focus on other sales and marketing activities during low hours could be more efficient and effective for the company.

### 2/ Customer

https://public.tableau.com/app/profile/dai.phuong.ngo/viz/SentimentAnalysis-DashboardCustomers/DashboardCustomer?publish=yes

![Dashboard - Customer](https://user-images.githubusercontent.com/70437668/140887847-03b787af-991a-40df-b7e3-0663d1de12cb.jpg)

As stated by the **`Customer Chats by Hour`**, this Line chart shows a similar trend with what we saw before. So it could strengthen the previously stated point as follows. The peak time for Customer chats was in the early morning before work or dropping off kids to school and during lunch break. The least active time was *`in the late morning, before noon and after lunch break`*. Their most active chatting time was in the *`early morning, during break`*. And their busiest time was at 10 AM and after 3 PM, and even in the whole evening.

As maintained by the **`Customer Chats by Weekday`**, the most likeable weekdays for customers to contact Fan Pages were *`Tuesday and Friday`*. The lowest point was on Thursday. This could be because after starting a new busy working week on Monday, they tended to be more engaging with Fan Pages for further contact. Thursday's moods could be quite intense at work to complete as many tasks as possible before coming to work on Friday. Friday is the last working day of the week so they could chill more and text the Fan Pages.

As specified by the **`Top Customers contacting Fan Pages (Bar)`**, to be more exact, Customer ID was added instead of / before Customer Name to make sure that the chart can avoid duplicated names from different Customers with the same name.

In line with the **`Top Customer Name confirming transaction by Count of Intention (Stack Bar)`**, filtered by confirmed transactions only, it shows the top customers purchasing products. The most loyal customer here is *`TTTT`*. Others appear on the current screen should be well taken care of.

In keeping with the **`Most Complained Customers (Stack Bar)`**, this Bar chart covers all frequent high demanding customers with complaints in all shown issues. By showing their Customer IDs on the chart, we can find their Conversations to understand further why they complained.

### 3/ Intentions

https://public.tableau.com/app/profile/dai.phuong.ngo/viz/SentimentAnalysis-DashboardIntention/DashboardIntention

![Dashboard - Intention](https://user-images.githubusercontent.com/70437668/141034889-7522ed08-3e50-4238-a6f5-a248edcb063f.jpg)

According to the **`Top Intentions chart`**, generally, the Top Intentions include *`yes confirmation, asking and providing customer information`*. Yes confirmation covers an agreeable answer from customer on different aspects, including confirmed transaction and other agreed terms. So, we might need to look further into Conversation content/details to know more about this value. In other charts, we will choose these values by group of asking, providing info and confirming, instead. Customers mainly talked about *`price, promo, their health issues and personal background, feedback after usage and confirmed transaction`*. The minority of chat intentions cover complaints and asking about product details, store addresses. 

As per the **`Top Intentions by Hour`**, this shows a similar trend as above so we will look into the next chart breaking down into different significant Intentions. It proves that Customers really cared about a *`product guarantee of efficacy, their personal health issues/background and current/used diet products`* to compare with our offers. They also tend to provide their *`comments and feelings after using our products and their expectations`*.

In terms of the **`Top 10 Intentions in 2019 and 2020`**, Customers seemed to talk about our *`products' prices and guaranty`* to compare with what they were using or had used. They really concerned about a realiable products to aleviate their weight and might not be satisfied with their used/current products yet.

Looking at the **`Confirmation over Complaint by Fan Page Name`**, the Top Fan Pages received Customer Intentions regarding *`yes confirmation, confirmed transactions*`. However, complaints about disturbing their social network from the Sales team's side still existed among Fan Pages, notably the *`Fan Page 27`*. The Sales team might have contacted at wrong times when they were busy and might have been approaching customers too often unnecessarily. The approach method should be reconsidered to avoid unwanted complaints causing negative customer experiences.

Moving on to the **`Count of Intention (Complaint) by Fan Page, Intention`**, *`Complaint about disturbance`* seemed to be the most among all kinds of complaints. Even the top 2 Fan Pages had the most complaints about disturbance. *`Fan Page 27`*'s got the highest amount of disturbance complaints which was even double their received complaints about price.

### 4/ Entities

https://public.tableau.com/app/profile/dai.phuong.ngo/viz/SentimentAnalysis-DashboardEntities/DashboardEntities

![Dashboard - Entities](https://user-images.githubusercontent.com/70437668/141035408-4ce73843-e9f6-44d4-9a82-a82996925ce7.jpg)

As per the **`Top Entities`**, it sketches a logical trend of Customer Intentions about their health issues and background. The first entity was about their *`Poids`*. That is the ultimate reason that they approached our Fan Pages. Secondly, they were concerned about how long they could see a result or a *`gradual efficacy`*. Thirdly, they mentioned a lot about their *`sickness`* before, during and after using our products. Probably, they were taking side effects from products into considerations. Then, they also compared the offered products with *`autre produits`* from competitors. A group of customers also paid attention to their *`grossesse`* and informed with Sales teams. Sales team should be very aware of their *`problème de santé`* and updated feedback on constant basis to make sure of customer satisfaction and release doubts and concerns when using our products to build long-lasting trust.

Following the **`Weightage of Top Entities (Pie)`**, it represent a quite equal percentage among the top 3 Entities, including *`Poids, Temps, Problème de santé`*.

Regarding the **`Entities by 2019`** and **`Entities by 2020`**, in both years, *`Poids, Temps, Problème de santé`* are still the most significant Entities in Customer chats.

In *`November 2019`*, there was a surge of customers providing their information for asking and purchasing. They also mentioned about, but not too often, their *`Mariage / Grossese, Produit de l'entreprise, Tailles and Noms`*. Then there was a downturn of all entities in December. This might be because they were saving to spend on Christamas and New Year purposes.

In *`2020`*, overall, the trend fluctuated a lot constantly through the first year of the COVID-19 pandemic. The trend slightly mounted up for several most important mentioned entities from January to February. And then it dropped down in March and surged to the peak of the year in April. This might be because they were saving after Lunar New Year a bit before spending more on healthy and diet products after receiving a grand bonus at work at the end of each year if they completed a round full woking year. Another reason might be that the VN government had managed to control the pandemic succesfully at the first stage so customers might be willing to spend on our products besides their casual needs.

However, the trend plummeted significantly from April until the end of June. This aligned with the new order of lockdown from the VN government in the whole April as VN had stepped in the first wave of the pandemic. After April, customers seemed to spend less on our products but their basic daily needs instead. We can see a drop in consumer demand during these months. 

The demand very slight improved in July but in late July, the VN government announced the second wave, mainly in Da Nang with unknown roots of transmission. This might have affected customer demand for diet products but basic groceries. This second wave had been lasting until the end of 2020 due to shortage of Vaccines for a better pandemic control and economic as well as customer demand's boost.

### 5/ Confirmed vs Not Confirmed

https://public.tableau.com/app/profile/dai.phuong.ngo/viz/SentimentAnalysis-Dashboard-ConfirmedvsNotConfirmedTransaction/Dashboard-ConfirmedvsNotConfirmedTransaction

![Dashboard - Confirmed vs Not Confirmed Transaction](https://user-images.githubusercontent.com/70437668/141924414-c6dc20ff-2257-4a53-bd16-337c63a57f5b.jpg)

First, looking at the ``Confirmed vs Not Confirmed Ratio``, overall, Confirmed Transaction gained slightly more than *`10%`* of all Intentions through all Fan Pages.

Then, I have visualized the ``Top 10 Customers with most Confirmed Transactions by Fan Page``. Here users can choose a certain Fan Page to see top high demanding customers by each Page to focus on their future purchases. 

Observing the ``Confirmed vs Not Confirmed Ratio by Customer ID``, the Customer ID *`312...720`* features the Top Customer among all Customers through all Fan Pages, not only on **Fan Page 27**.

Moving on to the ``Confirmed vs Not Confirmed Ratio by Fan Page``, *`Fan Page 27`* and *`Fan Page 44`* obtained the most Intentions of Confirming Transactions by 14.11% and 10.23%, ranking 1st and 2nd  among all Fan Pages, respectively. 

### 6/ Distribution of Intention Groups by Fan Pages, Intention Labels

https://public.tableau.com/app/profile/dai.phuong.ngo/viz/SentimentAnalysis-Dashboard-DistributionofIntentionGroupsbyFanPagesIntentionLabels/Dashboard-DistributionofIntentionGroupsbyFanPagesIntentionLabels

![Dashboard - Distribution of Intention Groups by Fan Pages, Intention Labels](https://user-images.githubusercontent.com/70437668/144695895-faa1bf57-3279-4d21-8710-287e22291785.jpg)

As shown on the ``Count of Intentional Labels by Fan Pages, Intention Groups`` and ``Radar Chart - Intention Group by Fan Pages``, *`Fan Page 27`* clearly played the most significant and active role among Fan Pages with the highest Count of Intention Labels by Groups. It also led the 1st rank in the *Intention - Confirmer la transaction*, which is the most important Intention we should look at to know which Fan Pages got the most confirmed transactions. *`Donner du feedback`* also dominated the most Intentions Labels by Count but this Intention is not as impactful as the *`Intention - Confirmer la transaction`* in terms of Transaction. 

Regarding the ``Count of Intention Labels by Intention groups, Intention labels``, *`Transaction - Acheter (aujourd'hui)`* is an approximate threefold covering of *`Transaction - Recevoir un autre jour`*, 47.5K versus 15.9K, respectively.
