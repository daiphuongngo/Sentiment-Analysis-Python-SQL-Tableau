# Sentiment Analysis for online products and their fan pages

## Category:

- E-commerce / E-selling

- Application

- Retail

- Consumer product

## Overview

Building a system for business insights & analysis using Natural Language Processing of customer dialogs & participating in Project Planning, Data Operations, Model Engineering, Machine Learning, Visualization while using at all production stages: 

-	SQL (extract, organize data from customer conversations on Facebook Fan Page), 

-	Python (conduct Exploratory Data Analysis to refine datasets, use SQLAlchemy as Object Relation Mapper on Virtual Environment to read, insert CSV files, translate Python classes to created tables on the relational database, handle large datasets efficiently by Batch Processing) 

-	TablePlus (create & design tables in this MySQL Relational Database for receiving datasets from Python & execute SQL queries),

-	Tableau (visualize refined datasets for insights of customer sentiment), Docker (run & manage applications), 

## Targets & Achievements:

An online retail business should be able to use their vast amounts of data and information in such a way that impacts the business, including:

Tracking customer & sales activites 

- Identifying purchase habits

- Detecting user trends and patterns

- Recommending purchases

- Determining price optimizations

- Identifying potential & complaining customers

## Dataset:

`Conversation:`

|Message_ID | Fanpage | PSID	| FanpageName	| CusName |	Message | Conversation_ID	| Sender |
|-|-|-|-|-|-|-|-|

`Conversation_Information:`

| ID | Conversation_ID | CustomerCount | SalesCount	| StartTime	| EndTime |
|-|-|-|-|-|-|

`Customer:`

| ID | PSID |	CusName |
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
```
pip install flask sqlalchemy flask-sqlalchemy
```

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

## Creating 2 CSV files from dataset by Batch Processing

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

# **`Data Analyst:`**

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
