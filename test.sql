SELECT DISTINCT p.*,  COUNT(DISTINCT c.comment_id) as numberOfComment, COUNT(DISTINCT r.reaction_id) as numberOfReaction, pic.url_medium as picture
FROM (
SELECT * FROM rashion.post WHERE is_delete='0'

) as p
JOIN rashion.user_follower as uf ON (uf.follow_id = p.owner_id) and (uf.user_id='1')
JOIN rashion.picture as pic ON p.picture_id = pic.picture_id
LEFT JOIN rashion.comment as c ON c.post_id = p.post_id
LEFT JOIN rashion.reaction as r ON r.post_id = p.post_id
GROUP BY post_id
ORDER BY post_id DESC 
 
            
            
            
