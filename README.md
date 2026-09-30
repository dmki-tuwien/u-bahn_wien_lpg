![DOI: 10.5281/zenodo.23060297](https://zenodo.org/badge/DOI/10.5281/zenodo.23060297.svg)

# U-Bahn Wien LPG

This repository contains CSV files and an accompanying Cypher script for the creation of a labeled property graph (LPG) that models the U-Bahn system of the city of Vienna.

To load this graph into Neo4j, place this repository in [Neo4j's `import` folder](https://neo4j.com/docs/operations-manual/current/configuration/file-locations/#neo4j-import) and execute the Cypher statements provided in the file [load_ubahn_wien.cypher](load_ubahn_wien.cypher).

The data used for this graph originates from the [Wikipedia page "Liste der Wiener U-Bahn-Stationen
"](https://de.wikipedia.org/wiki/Liste_der_Wiener_U-Bahn-Stationen).
To highlight the importance of labels and types in an LPG, additionally a node modeling the club "U4" is contained in the graph.
