
-- Insert a card
INSERT INTO cards VALUES (9122001, 'Meta-Rildo', 'TEQ', 'Extreme', '1022001', false)
UPDATE cards SET thumb = '1003090' WHERE id = 9003091


-- Insert a round and a cards_rounds
INSERT INTO rounds VALUES (3, null, 7700035)
INSERT INTO cards_rounds (card_id, round_id) VALUES (9122001, 6)


SELECT * FROM rounds

