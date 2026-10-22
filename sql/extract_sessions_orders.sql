SELECT
-- Information about session
    s.date AS session_date,
    s.ga_session_id AS session_id,
-- Location and device
    sp.continent,
    sp.country,
    sp.device,
    sp.browser,
    sp.mobile_model_name AS device_model_name,
    sp.operating_system,
    sp.language AS browser_language,
-- Source of traffic
    sp.medium AS traffic_source_information,
    sp.channel AS traffic_channel,
-- Account data
    a.id AS registered_user_id,
    a.is_verified AS is_email_confirmed,
    a.is_unsubscribed AS is_newsletter_unsubscribed,
-- Product data
    p.category AS product_category,
    p.name AS product_name,
    p.price,
    p.short_description AS short_product_description
FROM `data-analytics-mate.DA.session` AS s
LEFT JOIN `data-analytics-mate.DA.session_params` AS sp
    ON s.ga_session_id = sp.ga_session_id
LEFT JOIN `data-analytics-mate.DA.account_session` AS acs
    ON s.ga_session_id = acs.ga_session_id
LEFT JOIN `data-analytics-mate.DA.account` AS a
    ON acs.account_id = a.id
LEFT JOIN `data-analytics-mate.DA.order` AS o
    ON s.ga_session_id = o.ga_session_id
LEFT JOIN `data-analytics-mate.DA.product` AS p
    ON o.item_id = p.item_id;
