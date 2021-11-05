# Sentiment Analysis for online products and their fan pages

## Category:

- E-commerce / E-selling

- Application

- Retail

- Consumer product

## Overview

Building a system for business insights & analysis using Natural Language Processing of customer dialogs & participating in Project Planning, Data Operations, Model Engineering, Machine Learning, Visualization while using at all production stages: 

-	SQL (extract, organize data from customer conversations on Facebook Fan Page), 

-	Python (conduct Exploratory Data Analysis to refine datasets, use SQLAlchemy as Object Relation Mapper on Virtual Environment to read, insert CSV files, translate Python classes to created tables on the relational database) 

-	TablePlus (create & design tables in the relational database for receiving datasets from Python & execute SQL queries),

-	Tableau (visualize refined datasets for insights of customer sentiment), Docker (run & manage applications), 

-	Kubeflow (build & experiment with Machine Learning pipelines), 

-	Tensorflow (examine existing recommended Machine Learning models to apply the best ones for sentiment analysis) 

## Dataset:

Conversation:

|Message_ID | Fanpage | PSID	| FanpageName	| CusName |	Message | Conversation_ID	| Sender |
|-|-|-|-|-|-|-|-|

Conversation_Information:

| ID | Conversation_ID | CustomerCount | SalesCount	| StartTime	| EndTime |
|-|-|-|-|-|-|

Customer:

| ID | PSID |	CusName |
|-|-|-|

Fan Page:
| ID | Fanpage | FanpageName | 
|-|-|-|

Conversation_Intention:

| Conversation_ID | Intention_Label | Intention_Score | 
|-|-|-|

Conversation Entities:

| Conversation_ID | Conversation_Entity | Conversation_Entity_Score | Conversation_Entity_Word |
|-|-|-|-|

## Installling 

Ubuntu 18.04 LTS

Virtual Enviroment:

- jupyter lab

- pandas

- numpy

- matloblib

- seaborn

- sqlachemy

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
pip install flask sqlalchemy flask-sqlalchemy
