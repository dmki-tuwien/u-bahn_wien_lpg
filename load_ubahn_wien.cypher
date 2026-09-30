CREATE CONSTRAINT IF NOT EXISTS FOR (s:Station) REQUIRE s.abbreviation IS UNIQUE ;
LOAD CSV WITH HEADERS FROM 'file:///data/stations.csv' AS station
WITH DISTINCT station.name as name, station.abbreviation as abbr, station.platform as platform, station.location as location
CALL (name, abbr, platform, location) {
  CREATE (s:Station {
    name: name,
    abbreviation: abbr,
    platform: platform,
    location: location
  })
} IN TRANSACTIONS OF 1000 ROWS;
CREATE (c:Club {name:"U4",capacity:815});
LOAD CSV WITH HEADERS FROM 'file:///data/connections.csv' AS c
CALL (c) {
  MATCH (a:Station {abbreviation: c.src})
  MATCH (b:Station {abbreviation: c.tgt})
  MERGE (a)-[c1:CONNECTED_BY]->(b)
  MERGE (a)<-[c2:CONNECTED_BY]-(b)
  SET c1.name = c.name, c2.name = c.name, c1.color = c.color, c2.color = c.color
} IN TRANSACTIONS OF 1000 ROWS;
