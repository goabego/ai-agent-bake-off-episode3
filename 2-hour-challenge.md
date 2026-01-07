# AI Agent Bake-Off Challenge

## Welcome, Challengers!

Welcome to the AI Agent Bake-Off. The goal of this competition is to push your agents to their limits and showcase their capabilities in a series of real-world, dynamic challenges. You have built your agents; now it's time to see how they perform under pressure. Access to **Google Cloud Sandbox** enviornments can be found below.

### Rules of Engagement

1.  **The Goal:** Winner will be the team that successfully completes the most challenges listed below 
2.  **Free Choice:** You may choose any three challenges you wish to attempt (yes you can do all 6 if you wish).
3.  **Verification:** After you have successfully completed a challenge, you must check in with the host to have your results verified. The host will confirm that the success criteria have been met.
4.  **Judging:** The judges will take into consideration how many challenges you complete; however this does not need to be demoed. 

---

## The Challenges

### Challenge 1: The Launchpad (Deployment)

**Objective:** Deploy your AI agent to a live, publicly accessible endpoint.

*   **Task:** Package your agent and deploy it to a cloud service of your choice (e.g., Google Cloud Agent Engine, Cloud Run, etc). The agent must be accessible via a secure (HTTPS) API endpoint.
*   **Success Criteria:**
    *   The agent is running and accessible from the public internet.
    *   A judge can successfully send a request to the endpoint and receive a valid, agent-generated response.
*   **Helpful Resources:** 
    *   [Agent Starter Pack Enhance to deploy to Agent Engine or Cloud Run](https://googlecloudplatform.github.io/agent-starter-pack/cli/enhance.html#project-structure-validation)
    *   [ADK Docs on deploying you Agent](https://google.github.io/adk-docs/deploy/agent-engine/#prepare-ad)


### Challenge 2: The Gauntlet (Load Testing)

**Objective:** Test your agent's performance and stability under high-traffic conditions.

*   **Task:** Perform a load test on your deployed agent's endpoint. The test should simulate a minimum of **1,000 unique users** making requests over a short period (e.g., 1-5 minutes).
*   **Success Criteria:**
    *   The team must provide a report from a recognized load testing tool (e.g., Locust, k6, JMeter, postman).
    *   The report must show that at least 1,000 virtual users made requests.
    *   The agent's endpoint must maintain a success rate of 85% or higher (i.e., fewer than 15% of requests result in server errors).
*   **Helpful Resources:** 
    *   [Agent Starter Pack Load Testing Sample (first ones are for live api, second are for everything else)](https://github.com/GoogleCloudPlatform/agent-starter-pack/tree/main/agent_starter_pack/deployment_targets/cloud_run/tests/load_test)
    *   [Postman quickstarts on load testing](https://quickstarts.postman.com/guide/load-testing/index.html?index=..%2F..index#2)


### Challenge 3: On-the-fly feature (Dynamic Adaptation)

**Objective:** Test your agent's ability to add a new feature and adapt its strategy based on new, unexpected instructions mid-task. Founders love being in the know, provide them the ability to get top reports form the public hackernews bigquery table. 

*   **Task:**
    1.  Your agent must connect to the public BigQuery dataset for Hacker News (`bigquery-public-data.hacker_news.full`).
    2.  It must provide a "top 5 stories this week report" when prompted by the user for lastest `hacker news stories`.
*   **Success Criteria:**
    *   The agent successfully formulates a valid BigQuery query and retrieves relevant data.
    *   The agent successfully pivots its execution upon receiving the new instruction.
    *   The final output directly and creatively addresses the *new* dictated instruction, proving it can do more than follow a single, pre-programmed path.
*   **Helpful Resources:** 
    *   [Sample Hacker News BQ Agent using ADK](https://github.com/goabego/hackernews-bq-agent/blob/main/README.md)


### Challenge 4: The Open GTM (MCP Exposure)

**Objective:** To demonstrate the agent's ability to expose its custom tools as a standalone service using the Multi-Capability Protocol (MCP), making them available for other developers and agents to use.

*   **Task:**
    1.  Choose at least one of your agent's custom-built tools (e.g., a tool for querying a specific database, generating a report, etc.).
    2.  Using the ADK's `mcp_server`, create a new Python script to launch a local MCP server that exposes the chosen tool(s).
*   **Success Criteria:**
    1.  The host, using a simple client tool (like `grpcurl` or a provided script), can connect to the running server.
    2.  The host can list the tools available on the server and see the team's custom tool advertised with the correct signature.
    3.  The host can successfully execute the tool via the MCP client with sample arguments and receive a correct, valid response.
*   **Helpful Resources:**
    *   [ADK Docs: Building an MCP Server](https://google.github.io/adk-docs/tools/mcp-tools/#2-building-an-mcp-server-with-adk-tools-mcp-server-exposing-adk)

### Challenge 5: The Ambassador (A2A Exposure)

**Objective:** To demonstrate the agent's ability to be exposed as a service for other agents to interact with, using the ADK's native Agent-to-Agent (A2A) protocol.

*   **Scenario:** "Your agent is a recognized expert, but now other automated systems want to consult it directly. Open your agent for collaboration by exposing it as an A2A endpoint."
*   **Task:**
    1.  Using the `adk.a2a.ExposingServer`, create a new Python script that wraps your main agent.
    2.  Launch the server to make your agent available for incoming A2A requests on a local port.
*   **Success Criteria:**
    1.  The A2A server starts successfully on the team's local machine.
    2.  A host, using a provided A2A client script, can successfully connect to your agent's server.
    3.  The host's client can send a prompt to your agent and receive a valid, coherent response, proving the end-to-end connection is working.
*   **Helpful Resources:**
    *   [ADK Docs: Exposing an Agent for A2A Communication](https://google.github.io/adk-docs/a2a/quickstart-exposing/)

### Challenge 6: The Visionary (Multimodal Input)

**Objective:** To showcase the agent's ability to understand and reason over multimodal inputs, combining images and text to solve a problem. 

*Note*: If you already have multimodal input you cannot do this!

*   **Scenario:** "Founders don't just write memos; they sketch on whiteboards. Your agent needs to understand a GTM plan from a snapshot of a brainstorming session."
*   **Task:**
    1.  The host will provide an image of a whiteboard containing a simple, handwritten GTM plan.
    2.  The agent must analyze the image and answer a specific question from the host, such as, "According to the whiteboard, what I recommend you do is..."
*   **Success Criteria:**
    1.  The agent successfully processes the image as part of its input.
    2.  The agent correctly interprets the handwritten text and structure from the image.
    3.  The agent provides an accurate text-based answer to the host's question.

---

## Team Resources

### Team: Zach & Laxmi
*   **Code:** [https://github.com/mzschandy/launchpad](https://github.com/mzschandy/launchpad)
*   **Architecture:** [tldraw Link](https://www.tldraw.com/f/ywDYY0KH7CzOxdAYwBc4b?d=v-2703.-752.3991.2304.N-WczzxdGlCI_6xYE3eJd)
*   **Google Cloud Sandbox Environment:** [Login Link](https://accounts.google.com/AddSession?service=accountsettings&sarp=1&continue=https%3A%2F%2Fconsole.cloud.google.com%2Fhome%2Fdashboard%3Fproject%3Dqwiklabs-gcp-03-410df09edbb0#Email=)
*   **Staging Project ID:** `qwiklabs-gcp-03-410df09edbb0`
*   **Production Project ID:** `qwiklabs-gcp-03-ba5905537024`
*   **Password:** `Up2gHuO7KRhB`
*   **User Accounts:**
    *   **Zach:** `student-03-4318bb2921c4@qwiklabs.net`
    *   **Laxmi:** `student-03-a567c5cdf030@qwiklabs.net`
    *   **Test:** `student-03-a0f3f3934b94@qwiklabs.net`

### Team: Muhammad & Ayo
*   **Code:** [https://github.com/ayoisio/ep3-agent-bake-off-startup-gtm-agents](https://github.com/ayoisio/ep3-agent-bake-off-startup-gtm-agents)
*   **Architecture:** [Figma Link](https://www.figma.com/design/E9FTXsFrtOh1ZmviXi7uKj/Agent-Bakeoff--Episode-3-?node-id=1-2&t=svHeJ34CRyKkeoVv-1)
*   **Google Cloud Sandbox Environment:** [Login Link](https://accounts.google.com/AddSession?service=accountsettings&sarp=1&continue=https%3A%2F%2Fconsole.cloud.google.com%2Fhome%2Fdashboard%3Fproject%3Dqwiklabs-gcp-00-247e15511666#Email=)
*   **Staging Project ID:** `qwiklabs-gcp-00-247e15511666`
*   **Production Project ID:** `qwiklabs-gcp-01-62b9accf4467`
*   **Password:** `gGo5mWPhQTU6`
*   **User Accounts:**
    *   **Muhammad:** `student-03-e6210cab483c@qwiklabs.net`
    *   **Ayo:** `student-03-4dfbd211eaf2@qwiklabs.net`
    *   **Test:** `student-03-6d775ed0c467@qwiklabs.net`

### Team: Daniel & Luis
*   **Code:** [https://github.com/DanielJEfres/GTMForge](https://github.com/DanielJEfres/GTMForge)
*   **Architecture:** [tldraw Link](https://www.tldraw.com/f/Rgz7B7Tn5DUpi9P_VHf1x?d=v219.636.2991.1727.pG8u-3ay57o4mE_SVCgVZ)
*   **Google Cloud Sandbox Environment:** [Login Link](https://accounts.google.com/AddSession?service=accountsettings&sarp=1&continue=https%3A%2F%2Fconsole.cloud.google.com%2Fhome%2Fdashboard%3Fproject%3Dqwiklabs-gcp-00-fa663a3a749a#Email=)
*   **Staging Project ID:** `qwiklabs-gcp-00-fa663a3a749a`
*   **Production Project ID:** `qwiklabs-gcp-00-a060e250f358`
*   **Password:** `Wsg1OuIyRhTu`
*   **User Accounts:**
    *   **Daniel:** `student-04-5a567528b649@qwiklabs.net`
    *   **Luis:** `student-04-385444cd3a49@qwiklabs.net`
    *   **Test:** `student-04-a0ad614ad357@qwiklabs.net`