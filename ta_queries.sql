/Total Requisitions/
SELECT COUNT(req_id) AS total_requisitions
FROM ta_data;

/Offer Acceptance Rate/
SELECT 
ROUND(
(COUNT(CASE WHEN offer_accepted = 'Yes' THEN 1 END) * 100.0) / COUNT(*), 2
) AS offer_acceptance_rate
FROM ta_data;

/Offers Accepted by Source/
SELECT source, COUNT(*) AS offers_accepted
FROM ta_data
WHERE offer_accepted = 'Yes'
GROUP BY source;

/Average Time to Hire per Recruiter/
SELECT recruiter, ROUND(AVG(days_to_hire),1) AS avg_time_to_hire
FROM ta_data
GROUP BY recruiter;

/Hard-to-Fill Roles/
SELECT role, ROUND(AVG(days_to_hire),1) AS avg_time_to_hire
FROM ta_data
GROUP BY role
ORDER BY avg_time_to_hire DESC;
