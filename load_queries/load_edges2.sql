LOAD FROM fdwContainerOf as row
    MATCH (r:Forum), (s:Post)
    WHERE (r).id::INT8 = (row).forumId and (s).id::INT8 = (row).postId
   CREATE (r)-[:containerOf]->(s);
LOAD FROM fdwPostHasCreator as row
    MATCH (r:Post), (s:Person)
    WHERE (r).id::INT8 = (row).postId and (s).id::INT8 = (row).personId
   CREATE (r)-[:hasCreatorPost]->(s);
LOAD FROM fdwCommentHasCreator as row
    MATCH (r:"Comment"), (s:Person)
    WHERE (r).id::INT8 = (row).commentId and (s).id::INT8 = (row).personId
   CREATE (r)-[:hasCreatorComment]->(s);
LOAD FROM fdwHasInterest as row
    MATCH (r:Person), (s:Tag)
    WHERE (r).id::INT8 = (row).personId and (s).id::INT8 = (row).tagId
   CREATE (r)-[:hasInterest]->(s);
LOAD FROM viewHasMember as row
    MATCH (r:Forum), (s:Person)
    WHERE (r).id::INT8 = (row).forumId and (s).id::INT8 = (row).personId
   CREATE (r)-[:hasMember {'joinDate': (row).joinDate}]->(s);
LOAD FROM fdwHasModerator as row
    MATCH (r:Forum), (s:Person)
    WHERE (r).id::INT8 = (row).forumId and (s).id::INT8 = (row).personId
   CREATE (r)-[:hasModerator]->(s);
LOAD FROM fdwPostHasTag as row
    MATCH (r:Post), (s:Tag)
    WHERE (r).id::INT8 = (row).postId and (s).id::INT8 = (row).tagId
   CREATE (r)-[:hasTagPost]->(s);
LOAD FROM fdwCommentHasTag as row
    MATCH (r:"Comment"), (s:Tag)
    WHERE (r).id::INT8 = (row).commentId and (s).id::INT8 = (row).tagId
   CREATE (r)-[:hasTagComment]->(s);
LOAD FROM fdwForumHasTag as row
    MATCH (r:Forum), (s:Tag)
    WHERE (r).id::INT8 = (row).forumId and (s).id::INT8 = (row).tagId
   CREATE (r)-[:hasTagForum]->(s);
LOAD FROM fdwHasType as row
    MATCH (r:Tag), (s:TagClass)
    WHERE (r).id::INT8 = (row).tagId and (s).id::INT8 = (row).tagclassId
   CREATE (r)-[:hasType]->(s);
LOAD FROM fdwOrganIsLocatedIn as row
    MATCH (r:Organization), (s:Place)
    WHERE (r).id::INT8 = (row).organId and (s).id::INT8 = (row).placeId
   CREATE (r)-[:isLocatedInOrgan]->(s);
LOAD FROM fdwPostIsLocatedIn as row
    MATCH (r:Post), (s:Place)
    WHERE (r).id::INT8 = (row).postId and (s).id::INT8 = (row).placeId
   CREATE (r)-[:isLocatedInPost]->(s);
LOAD FROM fdwCommentIsLocatedIn as row
    MATCH (r:"Comment"), (s:Place)
    WHERE (r).id::INT8 = (row).commentId and (s).id::INT8 = (row).placeId
   CREATE (r)-[:isLocatedInComment]->(s);
LOAD FROM fdwPersonIsLocatedIn as row
    MATCH (r:Person), (s:Place)
    WHERE (r).id::INT8 = (row).personId and (s).id::INT8 = (row).placeId
   CREATE (r)-[:isLocatedInPerson]->(s);
LOAD FROM fdwIsPartOf as row
    MATCH (r:Place), (s:Place)
    WHERE (r).id::INT8 = (row).place1Id and (s).id::INT8 = (row).place2Id
   CREATE (r)-[:isPartOf]->(s);
LOAD FROM fdwIsSubclassOf as row
    MATCH (r:TagClass), (s:TagClass)
    WHERE (r).id::INT8 = (row).tagclass1Id and (s).id::INT8 = (row).tagclass2Id
   CREATE (r)-[:isSubclassOf]->(s);
LOAD FROM viewKnows as row
    MATCH (r:Person), (s:Person)
    WHERE (r).id::INT8 = (row).person1Id and (s).id::INT8 = (row).person2Id
   CREATE (r)-[:knows {'creationDate': (row).creationDate}]->(s)
   CREATE (s)-[:knows {'creationDate': (row).creationDate}]->(r);
LOAD FROM viewLikesPost as row
    MATCH (r:Person), (s:Post)
    WHERE (r).id::INT8 = (row).personId and (s).id::INT8 = (row).postId
   CREATE (r)-[:likesPost {'creationDate': (row).creationDate}]->(s);
LOAD FROM viewLikesComment as row
    MATCH (r:Person), (s:"Comment")
    WHERE (r).id::INT8 = (row).personId and (s).id::INT8 = (row).commentId
   CREATE (r)-[:likesComment {'creationDate': (row).creationDate}]->(s);
LOAD FROM fdwReplyOfPost as row
    MATCH (r:"Comment"), (s:Post)
    WHERE (r).id::INT8 = (row).commentId and (s).id::INT8 = (row).postId
   CREATE (r)-[:replyOfPost]->(s);
LOAD FROM fdwReplyOfComment as row
    MATCH (r:"Comment"), (s:"Comment")
    WHERE (r).id::INT8 = (row).comment1Id and (s).id::INT8 = (row).comment2Id
   CREATE (r)-[:replyOfComment]->(s);
LOAD FROM fdwStudyAt as row
    MATCH (r:Person), (s:Organization)
    WHERE (r).id::INT8 = (row).personId and (s).id::INT8 = (row).organId
   CREATE (r)-[:studyAt {'classYear': (row).classYear}]->(s);
LOAD FROM fdwWorkAt as row
    MATCH (r:Person), (s:Organization)
    WHERE (r).id::INT8 = (row).personId and (s).id::INT8 = (row).organId
   CREATE (r)-[:workAt {'workFrom': (row).workFrom}]->(s);

