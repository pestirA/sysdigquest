# Unboxing Sysdig
A repo to unbox Sysdig. Sysdig is on a mission to make every Cloud deployment secure And reliable.

# "Sysdig is on a mission to make every Cloud deployment secure And reliable.”

# Background
Unboxing Sysdig- and it was as much fun as it looks
Thanks for the opportunity AND trial license to dive deep into this amazing value
![Screenshot 2023-10-16 at 5 58 49 PM](https://github.com/pestirA/sysdigquest/assets/35427591/b4e0a014-177e-4ed1-a613-26819d668fe8)

# The Architecture 
![votingapp-architecture excalidraw](https://github.com/pestirA/sysdigquest/assets/35427591/80b01633-0281-4ebc-9e99-9de4665b6976)
A front-end web app in Python which lets you vote between two options
A Redis which collects new votes
A .NET worker which consumes votes and stores them in…
A Postgres database backed by a Docker volume
A Node.js web app which shows the results of the voting in real time


# The Voting App
![Screenshot 2023-10-16 at 6 01 17 PM](https://github.com/pestirA/sysdigquest/assets/35427591/a395f820-e839-4cab-b3b5-7681b97646e6)

# Prerequisites: To get started with the prerequisites, we setup our developer environment.  
Setup your google cloud account
Install Terraform
Setup Docker Desktop
Setup VSCode
Clone the challenge repo
Secure Sysdig Trial License

# The Challenge
Deploy a GKE Cluster using Terraform - **Complete**
Get Voting App Up and Running on the Cluster - **Complete**
Secure a trial license of Sysdig Secure and Monitor - **Complete**
Deploy Sysdig to GCP UsWest using Terraform - **Complete**
Deploy Sysdig Agents to your Existing and New Clusters - **Complete**

# Dive Deep into the Sysdig Platform - Secure - In Progress
  Scan the images being used for the Voting App, what do the results mean? Which one has the most Risk? Why? - **Complete - Address on Call**
  Bonus points if you setup a Github action to scan an image with our cli scanner - Pending
  Integrate IaC with the voting app in your github repo. - **Complete**
  Compliance? Setup a Zone for your App & repo. Configure a benchmark to run. Submit a PR to the voting app repo from Sysdig compliance
  Enable Runtime Policies, generate some events. Be creative with the events you create and then. show us how you did it and why you think the activity maybe suspicious? 
  Activity audit! Why's that valuable? **Complete**

Dive Deep into the Sysdig Platform - Monitor - **In Progress**
  Advisor, what is the usage of your cluster vs the requiests and limits? What other interesting information can you find? **Address on Call**
  Build a PromQL query using the query builder in the explore section of Sysdig Monitor using metrics from the Voting App (bonus points if you use StatsD metrics in a PromQL query) - **Complete**
 
  # Memory Usage in a Kubernetes Cluster
    avg by (agent_tag_cluster) ((sysdig_host_memory_used_bytes/sysdig_host_memory_total_bytes)
    * on(host,agent_tag_cluster) sysdig_host_info{agent_tag_cluster=~".+"}) * 100
  ![Screenshot 2023-10-16 at 6 32 48 PM](https://github.com/pestirA/sysdigquest/assets/35427591/bd83f42a-0a0a-497c-8a53-a306e5217854)

  Build a dashboard with your query + static metrics from Sysdig that relate multiple things together 
  Add views to the dashboard that might be interesting to a user **Complete**

Review Findings of your GKE Cluster and Application - 

**Demonstrate Sysdig Platform proficiency **
What does connecting a Kubernetes cluster give you?
  Runtime Threat Detection
  Host Scanning
  Runtime Image Scanning
  Kubernetes Security Posture Management (Compliance)

As a platform customer, you have access to Sysdig Monitor. Launch Monitor to fully utilize Sysdig!

# Sysdig Monitor
The user experience on this is magical - imagine out of the box, one click monitoring with ability to save these to your dashboards
Yes the dashboard provide you all these details on your k8 clusters! Priceless :) 

**Get Started with PromQL**
Sysdig built form-based querying on top of PromQL, making queries faster and easier for you to write. 
All metrics are enriched with cloud and Kubernetes metadata avoiding complicated PromQL joins.
![Screenshot 2023-10-16 at 6 25 05 PM](https://github.com/pestirA/sysdigquest/assets/35427591/a6e2fdb0-2717-492c-a9fb-7bffb383baf4)

**Workload Status & Performance Dashboard**
Monitor your Kubernetes workloads and get quick answers to common problems: Are all the pods running, or is anything restarting? How is the service or workload operating? Monitor with Golden Signals automatically collected using Sysdig agent eBPF technology. What is CPU/memory usage vs requests and limits?
![Screenshot 2023-10-16 at 6 09 38 PM](https://github.com/pestirA/sysdigquest/assets/35427591/1337d87d-04e2-469f-9187-36f4ac3588d4)

**Pod Status & Performance Dashboard**
Dive one level deeper and look at the Pods inside your workloads. Here you will be able to see individual Pod performance, CPU or memory bottlenecks, and compare between the different instances of a workload.
![Screenshot 2023-10-16 at 6 11 38 PM](https://github.com/pestirA/sysdigquest/assets/35427591/663fdf61-0c29-4ec3-a9a7-9c39cf5ac32f)

**Cluster Capacity Planning Dashboard**
Is your cluster sized properly for existing deployed applications? Identify over-commit on CPU or memory that can lead to Pod evictions, unused requested resources or containers without limits defined.
![Screenshot 2023-10-16 at 6 13 58 PM](https://github.com/pestirA/sysdigquest/assets/35427591/4da85254-1a57-407b-b559-b4aee3526bb0)

**Cluster/Namespace Available Resources**
Does the cluster have enough capacity for deploying a new workload? Or for increasing CPU or memory requests or limits on an existing application? Find out with this dashboard.
![Screenshot 2023-10-16 at 6 19 46 PM](https://github.com/pestirA/sysdigquest/assets/35427591/53cdaefe-571c-4e47-b292-c15091e46277)

**Pod Rightsizing & Workload Capacity Optimization**
When you need to optimize your capacity, it's hard work to pinpoint greedy workloads requesting more resources than they use, or when the CPU or limits are just too high. This dashboard will help you out, setting the right request and limits becomes easy.
![Screenshot 2023-10-16 at 6 20 20 PM](https://github.com/pestirA/sysdigquest/assets/35427591/9e04164d-faff-4ae4-b636-f527b0d73279)

Sysdig Monitor is a monitoring, troubleshooting, and alerting suite offering deep, process-level visibility into dynamic, distributed production environments. Sysdig Monitor captures, correlates, and visualizes full-stack data, and provides dashboards for monitoring. Major benefits include:

Explore and monitor application performance at any level of the infrastructure stack
Correlate metrics and events, and compare with past performance
Observe platform state and health
Auto-detect anomalies
Visualize and share performance metrics with out-of-the-box and custom dashboards
Powerful, tuned, and flexible alerts
Proactively alert on incidents across services, hosts, containers and so on
Trigger system captures for offline troubleshooting and forensics
Analyze system call activity to accelerate problem resolution
Helpful Links
Read about Getting Started with Sysdig Monitor https://docs.sysdig.com/en/docs/sysdig-monitor/getting-started-with-sysdig-monitor/

Watch this Beginner's Tutorial for Sysdig Monitor https://www.youtube.com/watch?v=dofsUXYm8Lk&t=7s
