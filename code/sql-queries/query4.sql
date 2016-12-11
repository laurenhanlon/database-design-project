"""
Query 4: Project Matching


Consultants rank projects and project leaders rank consultants. These preferences are pulled and exported to R to run a stable marriage algorithm resulting in a suggested project pairing.
In the userform the user provides the current semester.
"""

SELECT Consultant_Rank.Project_lead, Consultant_Rank.Consultant, Consultant_Rank.Rank
FROM Consultant_Rank;

SELECT Project_Rank.Consultant, Project_Rank.Project_lead, Project_Rank.Rank
FROM Project_Rank;
