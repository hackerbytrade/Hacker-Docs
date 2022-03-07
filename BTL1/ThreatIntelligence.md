Cyber Kill Chain Stages
 

[1] Reconnaissance:
Attackers: Malicious actors will conduct research on the target organization typically using both active and passive reconnaissance methods such as domain record lookups, public IP range port and vulnerability scanning, scouting out employees on social media, and more.

Defenders: Activity conducted by the attackers at this stage will come in the format of precursors, such as IPs that are performing port or vulnerability scanning, employees being approached by individuals that they do not know, and employees potentially receiving connection/friend requests on social media.

 

[2] Weaponization:
Attackers: Malicious actors create their own backdoor instead of purchasing commodity malware, and host this file on a domain they own. They then write a macro within a Microsoft Word document which connects to the attacker-owned domain and downloads the malware to the system where the file was opened.

Defenders: It is extremely hard for the security team to detect this stage, as it is not happening within their environment therefore they have no visibility of what happens outside the organization (with the exception of cyber threat intelligence). Typical defenses should be employed such as anti-virus, email security, and system hardening.

 

[3] Delivery:
Attackers: Malicious actors have crafted a spear-phishing email using information gathered on the target from OSINT sources. The email contains a Microsoft Office document with a malicious macro that will run malware in the context of the currently signed-in user.

Defenders: The security team should have email defenses in place such as attachment sandboxing which should be able to detect any malicious attachments such as immediately malicious binaries or malicious Word documents or PDFs.

 

[4] Exploitation:
Attackers: Malicious actors have identified a vulnerability, that if exploited, can provide them with higher privileges than the current compromised account has, providing them with more access and the ability to perform more actions.

Defenders: The security team can prepare for this stage by hardening systems and performing vulnerability management processes to identify and remediate vulnerabilities that are both internal and externally present.

 

[5] Installation:
Attacker: Malicious actor installs a backdoor and deploys persistence tactics and techniques to ensure that they can keep a foothold within the infected system, allowing continuous access.

Defenders: The security team can deploy endpoint detection and response (EDR) software agents to potentially infected hosts to allow for the detection, investigation, and eradication of a malicious presence.

 

[6] Command and Control:
Attackers: The malicious actor installs malware that opens a channel between the malicious actor and remote machine, allowing them to send commands to the malware and attempt to gain the ability to complete step 7, actions on objectives.

Defenders: The defenders last step to fully stop the threat, prevention of command execution is key

 

[7] Actions on Objectives:
Attackers: The malicious actor was successful in their attack and has obtained keyboard-access, they are now able to attempt to complete any objectives they have.

Defenders: The defender must detect this stage as quickly as possible to prevent further damage and minimize the time that the attacker can complete their objectives.