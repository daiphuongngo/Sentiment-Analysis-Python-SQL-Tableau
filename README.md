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
```
pip install flask sqlalchemy flask-sqlalchemy
```

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
ORDER BY SUM(ci.customer_count)
LIMIT 50;
```
### 4/ Customer Chats by Hour
```
SELECT cus.cus_name, HOUR(ci.start_time), COUNT(ci.customer_count) 
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

![](https://i.imgur.com/V5aSlLf.jpg)

As per the ***Most Visted Fan Pages***, Fan Page 44 and Fan Page 27 played significant roles online as they had the most visits of over 800K visits. 

According to the ***Interaction between Customers & Sales of Top 20 Fan Pages***, in the one hand, Fan Page 22 has a quite equal chats between Customers and Salespersons. In the other hand, Fan Page 44's Salespersons accounted for more chats than the Customers in all Conversations.

Looking at the ***Top Fan Page contacted by Hour***, The top 2 visited Fan Pages by hour over the day are still Fan Page 44 and Fan Page 27. The 2 peak time that customers visited all Fan Pages the most were at 7 AM and 1 PM. This is probably because they were about leaving for work and having lunch break so they could have free time to visit and chat. The lowest points were at 10 AM (probably when they fully concentrated at work or being out for grocery or preparing lunch) and from 3 - 9 PM. The afternoon might be busy for them to finish the work as soon as possible, pick up kids from school, prepare for dinner, clean up after dinner, spend time with family in the evening, relax and chill before bed time from 10 PM onwards. Then, they might have some free time to visit and chat before sleepping.

Therefore, having an available Sales team to listen and talk to customers via Fan Page chat at those peak hours could be beneficial and informative for them and having the Sales team focus on other sales and marketing activities during low hours could be more efficient and effective for the company.

### 3/ Intentions

![](https://i.imgur.com/GvZxanX.jpg)

Accoring to the ***Top Intentions chart***, generally, the Top Intentions include yes confirmation, asking and providing customer information. Yes confirmation covers an agreeable answer from customer on different aspects, including confirmed transaction and other agreed terms. So, we might need to look further into Conversation content/details to know more about this value. In other charts, we will choose these values by group of asking, providing info and confirming, instead. 

Customers mainly talked about price, promo, their health issues and personal background, feedback after usage and confirmed transaction. 

The minority of chat intentions cover complaints and asking about product details, store addresses. 

As per the ***Top Intentions by Hour***, this shows a similar trend as above so we will look into the next chart breaking down into different significant Intentions. It proves that Customers really cared about a product guarantee of efficacy, their personal health issues/background and current/used diet products to compare with our offers. They also tend to provide their comments and feelings after using oru products and their expectations.

In terms of the **Top 10 Intentions in 2019 and 2020**, Customers seemed to talk about our products' prices and guaranty to compare with what they were using or had used. They really concerned about a realiable products to aleviate their weight and might not be satisfied with their used/current products yet.

Looking at the ***Confirmation over Complaint by Fan Page Name***, the Top Fan Pages received Customer Intentions regarding yes confirmation, confirmed transactions. However, complaints about disturbing their social network from the Sales team's side still existed among Fan Pages, notably the Fan Page 27. The Sales team might have contacted at wrong times when they were busy and might have been approaching customers too often unnecessarily. The approach method should be reconsidered to avoid unwanted complaints causing negative customer experiences.

Moving on to the ***Count of Intention (Complaint) by Fan Page, Intention***, Complaint about disturbance seemed to be the most among all kinds of complaints. Even the top 2 Fan Pages had the most complaints about disturbance. Fan Page 27's got the highest amount of disturbance complaints which was even double their received complaints about price.
