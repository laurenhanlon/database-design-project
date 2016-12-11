"""
Query 3: Alumni Info by Industry and/or Company


This query is designed to pull all alumni at a certain company or at a more high level in an industry based on user input. The returned alumni will be ranked by number of events they have attended with the user, number of project worked on together, and by the closest year of graduation. The data will be processed using cluster analysis and the output of the analysis will show the member’s closeness of relationships with alumni through a dendrogram. This way current members are put in touch with alumni still interested and involved with the club as well as ones they are more likely to know.
In the userform, the user puts their name (Justin Rezende) and industry or company (Bain) they are looking for.
"""

@M_fname = ‘Justin’
@M_lname = ‘Rezende’
@Organization_name = ‘Bain’

SELECT Grad_school_name, Organization_name, Occupation, Industry, New_email Member_ID AS ‘Alumni_ID’
FROM Alumni
WHERE Member_ID IN (SELECT Member_ID FROM Alumni WHERE Organization_name = @Organization_name FROM Alumni;

CREATE TABLE Events_attended AS
SELECT a.Member_ID, DISTINCT a.Event_ID
FROM Attends a, Member m
WHERE a.Member_ID == (SELECT Member_ID 
	FROM Member 
	WHERE M_fname == @M_fname and M_lname == @M_lname );

SELECT a.Member_ID
FROM Alumni a
WHERE a.Member_ID IN (SELECT Member_ID FROM Events_attended);