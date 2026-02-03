-- =========================
-- Fraud Risk Analysis
-- =========================
--1. Overall Fraud Rate 
SELECT
  COUNT(*) AS total_transactions,
  SUM(is_fraud) AS fraud_transactions,
  ROUND(SUM(is_fraud) / COUNT(*), 4) AS fraud_rate
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis`;
--2. Fraud Rate by Transaction
SELECT
  transaction_type,
  COUNT(*) AS total_txns,
  SUM(is_fraud) AS fraud_txns,
  ROUND(SUM(is_fraud) / COUNT(*), 4) AS fraud_rate
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis` 
GROUP BY transaction_type
ORDER BY fraud_rate DESC;
--3. Fraud Rate by Amount Bucket
SELECT
  amount_bucket,
  COUNT(*) AS total_txns,
  SUM(is_fraud) AS fraud_txns,
  ROUND(SUM(is_fraud) / COUNT(*), 4) AS fraud_rate
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis`
GROUP BY amount_bucket
ORDER BY fraud_rate DESC;
--4. Fraud Rate by Merchant 
SELECT
  merchant_category,
  COUNT(*) AS total_txns,
  SUM(is_fraud) AS fraud_txns,
  ROUND(SUM(is_fraud) / COUNT(*), 4) AS fraud_rate
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis`
GROUP BY merchant_category
ORDER BY fraud_rate DESC
LIMIT 5;
--5. Fraud Rate by Hour of Day
SELECT
  hour,
  COUNT(*) AS total_txns,
  SUM(is_fraud) AS fraud_txns,
  ROUND(SUM(is_fraud) / COUNT(*), 4) AS fraud_rate
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis`
GROUP BY hour
ORDER BY hour;
--6. Device vs IP Risk Comparison
SELECT
  fraud_label,
  ROUND(AVG(device_risk_score), 2) AS avg_device_risk,
  ROUND(AVG(ip_risk_score), 2) AS avg_ip_risk
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis` 
GROUP BY fraud_label;
--7. Risk Tier Analysis
SELECT
  risk_tier,
  COUNT(*) AS total_txns,
  SUM(is_fraud) AS fraud_txns,
  ROUND(SUM(is_fraud) / COUNT(*), 4) AS fraud_rate
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis` 
GROUP BY risk_tier
ORDER BY fraud_rate DESC;
--8. Top 10 Highest Risk Users
SELECT
  user_id,
  COUNT(*) AS total_txns,
  SUM(is_fraud) AS fraud_txns
FROM `fraud-risk-analysis-486221.fraudtransactions.fraud risk analysis` 
GROUP BY user_id
HAVING fraud_txns > 0
ORDER BY fraud_txns DESC
LIMIT 10;
