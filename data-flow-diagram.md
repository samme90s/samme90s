# Data Flow Diagram

<!--
flowchart LR, TB, RL, BT to change the flow direction.
-->

[Mermaid Flowchart](https://mermaid.js.org/syntax/flowchart.html)

```mermaid
flowchart LR
      style serviceCluster stroke:#f66,stroke-width:2px,stroke-dasharray: 5 5;
      style dbCluster stroke:#66f,stroke-width:2px,stroke-dasharray: 5 5;

      client[Client/Frontend]
      client <-- Credentials --> authService
      client <-- Vote ballot --> voteService
      resService <-- Compiled result --> client

      admin[Admin]
      admin <-- Processed/categorized log data --> auditService
      admin <-- Voter credentials --> registrationService

      subgraph serviceCluster
            auditService([Audit-Service])
            dbLogs -- Log data --> auditService

            authService([Auth-Service])
            votersDb -- Voter credentials --> authService

            voteService([Voting-Service])
            voteService -- Vote ballot --> ballotDb

            resService([Result-Service])
            ballotDb -- Vote ballots --> resService

            registrationService([Registration-Service])
            registrationService <-- Voter credentials --> votersDb

            subgraph dbCluster
                  ballotDb[(Ballot-DB)]
                  ballotDb -- State --> dbBackups
                  ballotDb -- Requests --> dbLogs

                  votersDb[(Voters-DB)]
                  votersDb -- State --> dbBackups
                  votersDb -- Requests --> dbLogs

                  dbBackups(((DB-Backups)))
                  dbLogs(((DB-Logs)))
            end
      end
```
