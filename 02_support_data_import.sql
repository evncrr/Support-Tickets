LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/customer_support_tickets.csv'
INTO TABLE tickets
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Ticket_ID,
    Customer_Name,
    Customer_Email,
    Customer_Age,
    Customer_Gender,
    Product_Purchased,
    Date_of_Purchase,
    Ticket_Type,
    Ticket_Subject,
    Ticket_Description,
    Ticket_Status,
    Resolution,
    Ticket_Priority,
    Ticket_Channel,
    @First_Response_Time,
    @Time_to_Resolution,
    @Customer_Satisfaction_Rating
)
SET
    First_Response_Time = NULLIF(@First_Response_Time,''),
    Time_to_Resolution = NULLIF(@Time_to_Resolution,''),
    Customer_Satisfaction_Rating = NULLIF(@Customer_Satisfaction_Rating,'');
