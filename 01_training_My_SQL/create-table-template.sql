CREATE TABLE payment_order_histories (  
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (payment_order_id) REFERENCES payment_orders(id)
) COMMENT '';
