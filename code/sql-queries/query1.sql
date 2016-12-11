"""
Query 1: Applicant Score


The goal of this query is to return a table of all current applicants
and  their information including scores, GPA, and major.  Fake
applicant data with category scores and holistic candidate scores  for
theoretical applicants could be collected from TBG.  Using this data a
multilinear regression model could identify the relative importance of
each category, and using these values future applicants can be scored
and ranked to organize thinking around application process.
"""

SELECT Applicant.A_fname, Applicant.A_lname, Applicant.GPA,
Applicant.Teamwork_Score, Applicant.Presentation_Score, Applicant.Quant_Score,
Applicant.Nonprofit_Score, Applicant.Compatibility_Score, A_Majors.Major 
FROM Applicant 
INNER JOIN A_Majors 
ON Applicant.[Applicant_ID] = A_Majors.[Applicant_ID];
