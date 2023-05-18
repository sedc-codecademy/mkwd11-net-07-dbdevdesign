Select * From Clubs
Select * From Players


--Select c.Id as ClubId,
--		c.[Name] as ClubName,
--		p.Id as PlayerId,
--		p.FirstName + ' ' + p.LastName as PlayersName
--Select *
--From Clubs c
--Cross Join Players p
--GO

--Select *
--From Clubs c
--Inner Join Players p On c.Id = p.ClubId --p.ClubId = c.Id

Select *
From Clubs c
Full Outer Join Players p On c.Id = p.ClubId
--Order By ClubId Desc


Select *
From Clubs c
Left /*Outer*/ Join Players p On c.Id = p.ClubId


Select *
From Clubs c
Right /*Outer*/ Join Players p On c.Id = p.ClubId
