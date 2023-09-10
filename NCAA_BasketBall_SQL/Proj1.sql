
-- 4(a)
-- SELECT max(Points), Team
-- FROM seasonstats
-- GROUP BY Team
-- ORDER BY max(Points) DESC;

-- 4(b)
SELECT School, Mascot, Conference
FROM teams
WHERE Conference = 'Atlantic 10' OR Conference = 'SEC' OR Conference = 'Big 10';

-- 4(c)
SELECT ss.PlayerID, FirstName, LastName, max(Points)
FROM seasonstats ss, player
WHERE ss.PlayerID = player.PlayerID
GROUP BY ss.PlayerID
ORDER BY max(points) desc;

-- 4(d)
SELECT sum(Games)
FROM seasonstats
WHERE Season = 2023 and SeasonType = 1;

-- 4(e)
SELECT AwayTeam, AwayTeamScore, HomeTeam, HomeTeamScore, DateTime
FROM games
WHERE DateTime > '2023-03-07 22:00:00';

-- 4(f)
SELECT min(stadium.Capacity), stadium.Name, AwayTeamScore, HomeTeamScore
FROM stadium, games
WHERE games.StadiumID = stadium.StadiumID;

-- 4(g)
SELECT Team, Points, OffensiveRebounds
FROM seasonstats
WHERE Points > 60 AND OffensiveRebounds > 15;

-- 4(h) - Extra 5 queries 
-- (i) - Best player of all time
SELECT player.PlayerID, FirstName, LastName, Wins, Losses, seasonstats.Team, max(Points)
FROM seasonstats, player
WHERE seasonstats.PlayerID = player.PlayerID;

-- 4(h)(ii) - Best Team of all time
SELECT teams.TeamID, teams.School, teams.Mascot, seasonstats.Wins, seasonstats.Losses, max(Points)
FROM seasonstats, teams
WHERE seasonstats.TeamID = teams.TeamID;

-- 4(h)(iii) - Teams that have more losses than wins
SELECT seasonstats.TeamID, teams.School, teams.Mascot, seasonstats.Wins, seasonstats.Losses
FROM seasonstats, teams
WHERE seasonstats.TeamID = teams.TeamID
AND seasonstats.Losses > seasonstats.Wins;

-- 4(h)(iv) - Players in the 'F' position for Florida State School team
SELECT player.PlayerID, player.FirstName, player.LastName, player.TeamID, teams.School, teams.Mascot, player.Position
FROM player, teams
WHERE player.TeamID = teams.TeamID
AND School = "Florida State"
HAVING player.Position = 'F';

-- 4h(v) - Players with less than 15 points
SELECT seasonstats.PlayerID, player.FirstName, player.LastName, seasonstats.Team, seasonstats.Points
FROM player, seasonstats
WHERE player.PlayerID = seasonstats.PlayerID
HAVING seasonstats.Points < 15;


