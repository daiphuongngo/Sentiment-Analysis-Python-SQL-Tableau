
/*
Conversation:
|Message_ID | Fanpage | PSID	| FanpageName	| CusName |	Message | Conversation_ID	| Sender |

Conversation_Information:
| ID | Conversation_ID | CustomerCount | SalesCount	| StartTime	| EndTime |

Customer:
| ID | PSID |	CusName |

Fan Page:
| ID | Fanpage | FanpageName | 

Conversation_Intention:
| Conversation_ID | Intention_Label | Intention_Score | 

Conversation Entities:
| Conversation_ID | Conversation_Entity | Conversation_Entity_Score | Conversation_Entity_Word |
*/

/* Analysis in SQL:*/

-- 1/ Count Fan Page name
SELECT c.fan_page_name, COUNT(c.fan_page_name)
FROM conversation as c 
GROUP BY c.fan_page_name
ORDER BY c.fan_page_name DESC 
LIMIT 10;

-- 2/ Fan Page contacted by Hour
SELECT fp.fan_page_name, HOUR(ci.start_time), COUNT(c.fan_page_name)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN fan_page AS fp 
ON c.group_id = fp.fan_page_id
GROUP BY fp.fan_page_name
ORDER BY HOUR(ci.start_time) ASC, COUNT(c.fan_page_name) DESC

-- 3/ Total Chat by Cus ID & Cus Name
SELECT cus.cus_name, SUM(ci.customer_count)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN customer AS cus 
ON c.cus_id = cus.cus_id
GROUP BY cus.cus_
ORDER BY SUM(ci.customer_count)
LIMIT 50;

-- 4/ Customer Chats by Hour
SELECT HOUR(ci.start_time), COUNT(ci.customer_count) 
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN customer AS cus 
ON c.cus_id = cus.cus_id
GROUP BY HOUR(ci.start_time)
ORDER BY HOUR(ci.start_time) ASC;

-- 5/ Count of Intention by Fan Page
SELECT fp.fan_page_name, cui.intention_label, COUNT(cui.intention_label)
FROM fan_page AS fp 
INNER JOIN conversation AS c 
ON fp.fan_page_id = c.fan_page_id
INNER JOIN customer_intention AS cui 
ON c.group_id = cui.conversation_id 
GROUP BY fp.fan_page_name, cui.intention_label
ORDER BY COUNT(cui.intention_label) DESC; 

-- 6/ Top 10 Intentions by 2019
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

-- 8/ Top Intentions
SELECT cui.intention_label, COUNT(cui.intention_label)
FROM conversation_intention AS CUI 
ORDER BY COUNT(cui.intention_label);

-- 9/ Top Entities
SELECT ce.entities_label, COUNT(ce.entities_label), COUNT(ce.entities_label) / SUM(ce.entities_label) * 100 AS weightage
FROM conversation_entities AS ce 
ORDER BY COUNT(ce.entities_label) DESC;

-- 10/ Top 10 Entities by 2019
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

-- 11/ Top 10 Entities by 2020
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

-- 12/ Count of Intention - Transaction by Customer Name

SELECT cus.cus_id, cus.cus_name, cui.intention_label, COUNT(cui.intention_label)
FROM conversation_intention AS cui 
INNER JOIN conversation AS c 
ON cui.conversation_id = c.group_id
INNER JOIN customer AS cus 
ON c.cus_id = cus.cus_id
WHERE cui.intention_label = "Transaction - Achat" OR cui.intention_label = "Transaction - Expédition d'un autre jour"
GROUP BY cus.cus_id, cus.cus_name 
ORDER BY COUNT(cui.intention_label) DESC;

-- 13/ Interaction between Customer & Sales by Top 20 Fan Pages
SELECT fp.fan_page_name, ci.cus_count, SUM(ci.cus_count), ci.sales_count, SUM(ci.sales_count)
FROM conversation_information AS ci 
INNER JOIN conversation AS c 
ON ci.conversation_id = c.group_id
INNER JOIN fan_page AS fp 
ON c.group_id = fp.fan_page_id
GROUP BY fp.fan_page_name, ci.cus_count, ci.sales_count
ORDER BY SUM(ci.cus_count), SUM(ci.sales_count) DESC 
LIMIT 20;

-- 14/ Cus Count vs Sales Count by Hour

SELECT HOUR(ci.start_time), ci.cus_count, COUNT(DISTINCT(ci.cus_count)), ci.sales_count, COUNT(DISTINCT(ci.sales_count))
FROM conversation_information AS ci 
GROUP BY HOUR(ci.start_time), ci.cus_count, ci.sales_count
ORDER BY HOUR(ci.start_time) ASC;

-- 15/ Most Complaining Customers
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

-- 16/ % Intentions by Customers with selected of Intentions

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