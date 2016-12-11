"""
Query 2: Marketing Strategy Success


This query pulls data from applications regarding how an applicant heard about TBG. This will then be exported and analyzed to see which sources are increasing gross applications, which are most reported by applicants, and which have the highest “return on investment” in terms of work hours spent vs. applicant turnout. Additionally a regression analysis can be performed on trends in this ROI (Applicants/Hour of Effort) to forecast the most cost-effective strategy for the upcoming semester.
"""

SELECT Application.[Referral_Source], Application.[Semester], Count(Application.Referral_Source) AS CountOfReferral_Source
FROM Application
GROUP BY Application.[Referral_Source], Application.[Semester];