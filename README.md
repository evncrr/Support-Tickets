## Project Overview
- This project analyzes customer support tickets to provide actionable insights for IT and support teams. It demonstrates the use of SQL views, aggregation, and data analysis on real-world ticketing data. The project can help organizations improve customer satisfaction, optimize support workflows, and identify areas for product improvement.
## Dataset
- The dataset used contains simulated customer support tickets, including:
- Customer Information: Name, Email, Age, Gender
- Product Information: Product Purchased
- Ticket Details: Type, Priority, Status, Subject, Description
- Support Metrics: First Response Time, Time to Resolution, Customer Satisfaction Rating, Channel
- Example fields: Ticket_ID, Ticket_Type, Ticket_Priority, Time_to_Resolution, Customer_Satisfaction_Rating, Ticket_Channel, Product_Purchased.
## Views and Analytics
- The project creates multiple SQL views for summarizing and analyzing ticket data:
- TopIssueTypes – Identifies the most frequent ticket types.
- AvgResolutionByPriority – Calculates average resolution time by ticket priority.
- SatisfactionByChannel – Measures average customer satisfaction per support channel.
- FrequentProductIssues – Lists products generating the most tickets.
- SLACompliance – Tracks SLA compliance per ticket priority.
- TicketsByMonth – Shows ticket trends over time.
- LowestSatisfactionCustomers – Highlights customers with the lowest satisfaction ratings.
- SlowestResolvedCustomers – Identifies customers with the longest average resolution times.
- SlowestResolvedProducts – Shows products with the longest average resolution times.
- ChannelDistribution – Counts tickets by support channel.
- CustomerSatisfactionSummary – Combines satisfaction and resolution metrics for each customer.
- TicketStatusSummary – Provides a summary of ticket statuses (Open, Closed, Pending).
## Key Insights
- Quickly identify high-priority issues and bottlenecks in resolution workflows.
- Detect which products generate the most support tickets.
- Track SLA compliance and response efficiency by priority.
- Understand customer satisfaction trends by channel and individual customers.
- Enable data-driven decisions for improving support operations.
## Technical Highlights
- SQL views used to create reusable, query-ready insights.
- Aggregation functions: COUNT, AVG, ROUND.
- Date and time calculations using TIMESTAMPDIFF and DATE_FORMAT.
- Conditional logic in SQL for SLA compliance calculation.
- Ordering, grouping, and filtering to highlight actionable metrics.
