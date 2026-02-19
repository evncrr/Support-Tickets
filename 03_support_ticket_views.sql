-- Top Issue Types
CREATE OR REPLACE VIEW TopIssueTypes AS
SELECT Ticket_Type, COUNT(*) AS TicketCount
FROM tickets
GROUP BY Ticket_Type
ORDER BY TicketCount DESC;

-- Average Resolution Time by Priority
CREATE OR REPLACE VIEW AvgResolutionByPriority AS
SELECT Ticket_Priority,
       ROUND(AVG(TIMESTAMPDIFF(MINUTE, First_Response_Time, Time_to_Resolution)),2) AS AvgResolutionMinutes
FROM tickets
GROUP BY Ticket_Priority;

-- Customer Satisfaction by Channel
CREATE OR REPLACE VIEW SatisfactionByChannel AS
SELECT Ticket_Channel,
       ROUND(AVG(Customer_Satisfaction_Rating),2) AS AvgSatisfaction
FROM tickets
GROUP BY Ticket_Channel;

-- Frequent Products With Issues
CREATE OR REPLACE VIEW FrequentProductIssues AS
SELECT Product_Purchased, COUNT(*) AS TicketCount
FROM tickets
GROUP BY Product_Purchased
ORDER BY TicketCount DESC
LIMIT 10;

-- SLA Compliance by Ticket Priority
-- SLA thresholds (in hours): Critical=4, High=8, Medium=24, Low=48
CREATE OR REPLACE VIEW SLACompliance AS
SELECT Ticket_Priority,
       COUNT(*) AS TotalTickets,
       SUM(CASE 
             WHEN TIMESTAMPDIFF(HOUR, First_Response_Time, Time_to_Resolution) <= 
                  CASE
                      WHEN Ticket_Priority='Critical' THEN 4
                      WHEN Ticket_Priority='High' THEN 8
                      WHEN Ticket_Priority='Medium' THEN 24
                      ELSE 48
                  END
             THEN 1 ELSE 0 
           END) AS TicketsWithinSLA,
       ROUND(
           SUM(CASE 
                 WHEN TIMESTAMPDIFF(HOUR, First_Response_Time, Time_to_Resolution) <= 
                      CASE
                          WHEN Ticket_Priority='Critical' THEN 4
                          WHEN Ticket_Priority='High' THEN 8
                          WHEN Ticket_Priority='Medium' THEN 24
                          ELSE 48
                      END
                 THEN 1 ELSE 0 
               END) * 100.0 / COUNT(*), 2
       ) AS SLA_Percent
FROM tickets
GROUP BY Ticket_Priority;

-- Tickets By Month
CREATE OR REPLACE VIEW TicketsByMonth AS
SELECT DATE_FORMAT(Date_of_Purchase,'%Y-%m') AS Month, COUNT(*) AS TicketCount
FROM tickets
GROUP BY Month
ORDER BY Month;

-- Customers with Lowest Satisfaction
CREATE OR REPLACE VIEW LowestSatisfactionCustomers AS
SELECT Customer_Name, Customer_Email, 
       ROUND(AVG(Customer_Satisfaction_Rating), 2) AS AvgSatisfaction,
       COUNT(*) AS TotalTickets
FROM tickets
WHERE Customer_Satisfaction_Rating IS NOT NULL
GROUP BY Customer_Name, Customer_Email
ORDER BY AvgSatisfaction ASC
LIMIT 10;

-- Longest Resolution Times by Customer
CREATE OR REPLACE VIEW SlowestResolvedCustomers AS
SELECT Customer_Name, Customer_Email, 
       ROUND(AVG(TIMESTAMPDIFF(MINUTE, First_Response_Time, Time_to_Resolution)),2) AS AvgResolutionMinutes,
       COUNT(*) AS TotalTickets
FROM tickets
WHERE Time_to_Resolution IS NOT NULL
GROUP BY Customer_Name, Customer_Email
ORDER BY AvgResolutionMinutes DESC
LIMIT 10;

-- Longest Resolution Times by Product
CREATE OR REPLACE VIEW SlowestResolvedProducts AS
SELECT Product_Purchased,
       ROUND(AVG(TIMESTAMPDIFF(MINUTE, First_Response_Time, Time_to_Resolution)),2) AS AvgResolutionMinutes,
       COUNT(*) AS TotalTickets
FROM tickets
WHERE Time_to_Resolution IS NOT NULL
GROUP BY Product_Purchased
ORDER BY AvgResolutionMinutes DESC
LIMIT 10;

-- Channel Distribution
CREATE OR REPLACE VIEW ChannelDistribution AS
SELECT Ticket_Channel, COUNT(*) AS TicketCount
FROM tickets
GROUP BY Ticket_Channel
ORDER BY TicketCount DESC;

-- Customer Satisfaction and Resolution
CREATE OR REPLACE VIEW CustomerSatisfactionSummary AS
SELECT Customer_Name, Customer_Email,
       ROUND(AVG(Customer_Satisfaction_Rating),2) AS AvgSatisfaction,
       ROUND(AVG(TIMESTAMPDIFF(MINUTE, First_Response_Time, Time_to_Resolution)),2) AS AvgResolutionMinutes
FROM tickets
GROUP BY Customer_Name, Customer_Email
ORDER BY AvgSatisfaction DESC;

-- Ticket Status Summary
CREATE OR REPLACE VIEW TicketStatusSummary AS
SELECT Ticket_Status, COUNT(*) AS TicketCount
FROM tickets
GROUP BY Ticket_Status
ORDER BY TicketCount DESC;