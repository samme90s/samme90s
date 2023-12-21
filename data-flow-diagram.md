# Data Flow Diagram

<!--
flowchart LR, TB, RL, BT to change the flow direction.
-->

[Mermaid Flowchart](https://mermaid.js.org/syntax/flowchart.html)

The data holds information such as valid voters, votes cast etc. The databases should perhaps be seperated for security reasons.

```mermaid
flowchart LR
      style serviceCluster stroke:#f66,stroke-width:2px,stroke-dasharray: 5 5;
      style dbCluster stroke:#66f,stroke-width:2px,stroke-dasharray: 5 5;

      client[Client/Frontend]
      client <--> authService
      client <--> voteService
      client <--> resService
      admin[Admin]
      admin <--> dbLogsAnalysis
      dbLogsAnalysis([Log Analysis])
      dbLogs --> dbLogsAnalysis


      subgraph serviceCluster
            authService([Auth-Service])
            authService <--> votersDb
            voteService([Voting-Service])
            voteService <--> resDb
            resService([Result-Service])
            resService <--> resDb

            subgraph dbCluster
                  dbBackups(((DB-Backups)))
                  resDb --> dbBackups
                  votersDb --> dbBackups
                  dbLogs(((DB-Logs)))
                  resDb --> dbLogs
                  votersDb --> dbLogs


                  resDb[(Res-DB)]

                  votersDb[(Voters-DB)]
            end
      end
```
