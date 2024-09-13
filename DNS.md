1. DNS Caching:
- Implement a simple DNS caching mechanism in a programming language of your choice. Keep a cache of resolved DNS requests for a specified time period.

2. DNS Lookup:
- Use the nslookup, dig, or host command on a domain of your choice (e.g., www.example.com) and gather information like A records, MX records, and NS records. Summarize your findings.

3. Setting up a Local DNS Server:
- Install a DNS server (e.g., BIND on Linux) on your machine and set it up to resolve a few local domain names. Test the configuration by querying the server.

4. DNS Propagation:
- Make a change to a DNS record (e.g., change the A record) in your local DNS server and observe how long it takes for the change to propagate when queried from an external DNS server.

5. Round Robin DNS:
- Configure a round-robin DNS using multiple A records for the same domain name pointing to different IP addresses. Test the distribution of requests among the IP addresses.
