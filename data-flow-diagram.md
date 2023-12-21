# Data Flow Diagram

<!--
flowchart LR, TB, RL, BT to change the flow direction.
-->

[Mermaid Flowchart](https://mermaid.js.org/syntax/flowchart.html)

The data holds information such as valid voters, votes cast etc. The databases should perhaps be seperated for security reasons.

`DRE` _Direct-Recording Electronic_

```mermaid
flowchart LR
      style serviceCluster stroke:#f66,stroke-width:2px,stroke-dasharray: 5 5
      style dbCluster stroke:#66f,stroke-width:2px,stroke-dasharray: 5 5

      client[DRE]

      subgraph serviceCluster
            auth([Authentication Service])
            vote([Voting Service])

            subgraph dbCluster
                  db([Database])
                  dbBackup([Database Backup])
                  dbData[[Data]]
                  dbLog[[Log]]

                  db --> dbBackup
                  db <--> dbData
                  db --> dbLog
            end
      end

      dbLogAnalysis([Log Analysis])

      client <--> auth
      client <--> vote
      vote <--> db
      auth <--> db
      dbLog --> dbLogAnalysis
```
