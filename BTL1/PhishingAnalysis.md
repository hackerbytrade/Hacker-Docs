


Email Header:
Sending Email Address (Ex: J0hnSm1th@gmail.com)
Reply-to Address (Ex: F4keacc0unt2421@gmail.com)
Date Sent (Ex: 20th October 2019, 9:34 AM)
Sending Server IP (Ex: 40.92.10.10)
Reverse DNS of Sending Server IP (Ex: mail-oln040092010100.outbound.protection.outlook.com)
Recipient(s) (Ex: jason.s@domain.com, kirsty.p@domain.com, brian.b@domain.com)
Subject Line (Ex: Payroll Update – URGENT!)

Email with URLs:
Any relevant URLs (Sanitised) (Ex: hxxps://Healthcare-United[.]com/wp/index/2020/PAYPAL/lure.php?)

Emails with Attachments:
File Name(s) + Extension (Ex: PayrollDecember_UK.exe)
MD5 Hash(es)


Analysis:
This section will be the largest part of your report, and will cover the analysis you completed to assess the risk of any malicious artifacts such as attachments or URLs. You will include the tools you have used, and the results that they have provided. This can include visualization tools, reputation check results, as well as manual investigation methods such as detonating malware in a virtual sandbox.
==========================================
===================Report=================
==========================================
Artifacts Retrieved
Sender: amazonsupp0rt@outlook.com
Reply-to: no-reply@amazon.co.uk
Date: Monday 16th September 2019 19:25
Sending Server IP: 209.85.167.91
Reverse DNS: mail-lf1-f91.google.com
Recipients: claire.shelley@dicksonunited.co.uk
Subject: Suspicious Amazon Order Alert
URL: hxxp://maliciousdomainexample[.]com/
Attachments: None

Email Description:
You should aim to write approximately 1-2 sentences describing what the email looks like, and what it’s trying to get the recipient to do. 

Analysis:
This section will be the largest part of your report, and will cover the analysis you completed to assess the risk of any malicious artifacts such as attachments or URLs. You will include the tools you have used, and the results that they have provided. This can include visualization tools, reputation check results, as well as manual investigation methods such as detonating malware in a virtual sandbox.
This is going to be the most detailed part of your report, as this is where you actually assess the risk of malicious artifacts to the organization. You need to answer questions such as “is this URL malicious?” or “how damaging is this attachment?” whilst providing in-depth notes on the analysis methods and tools you used to investigate these artifacts. This section will later provide justification for any defensive measures that you wish to take, so there needs to be enough detail to allow senior analysts to come to the same conclusion that you have. In the next lesson, you will be given a chance to write your own Section 2 as practice before the final assessment.

Defensive Measures Take:
This part of a report, typically at the end, will mention the defensive actions that you have taken, or are requesting to be taken in order to protect the organization. From the previous lessons of this domain, you will know that the term defensive measures refer to activities after a phishing attack in order to prevent attacks using the same artifacts observed in the analyzed email. We can perform three main types of actions:

-Email artifact blocking (subject line, sending address, sending server IP)
-Web artifact blocking (URL, domain, IP)
-File artifact blocking (file name, file hash)

==========================================
Example One
 

In this example, the investigating analyst has come across a DHL credential harvester, which has been received by 23 employees. After investigating the email, the analyst retrieves the following artifacts:

Sender: contact@dhl.com
Sending Server IP: 209.85.167.42
Reverse DNS: mail-lf1-f42.google.com
Subject: “Failed Delivery DHL RESPOND NOW – URGENT!!”
URL: hxxps://dhl-faileddelivery.shanepppalkkbc.com (Example Value)
 

Example Report Section:
“[1] The sending address was successfully spoofing contact@dhl.com, however, the sending IP revealed it was actually a Gmail address, and therefore not from DHL. [2] We are unable to block the sending server IP, as it belongs to Gmail, and would have a negative impact on the business as legitimate emails would be blocked. [3] Blocking the sender “contact@dhl.com” is also not appropriate, as legitimate emails coming from that address will be blocked. [4] I have blocked the subject line on the email gateway, as it is highly unlikely legitimate DHL emails would use it. [5] There would be no negative impact to the business, and this action would prevent any more emails in this attack being delivered to employee mailboxes.

[6] Subject Line Block (Email Gateway) “Failed Delivery DHL RESPOND NOW – URGENT!!” on 22nd December at 12:03 PM by Jane Smith.
[7] The URL used within the credential harvester is a malicious domain “shanepppalkkbc[.]com” that utilizes a subdomain “dhl-faileddelivery” to look more effective when glancing at the link. [8] After investigating the domain, it was created purely for malicious purposes, and there is no business justification for employees to visit it, and we can block the entire domain to prevent users from visiting the existing malicious link, or any others that are hosted on the site.

[9] Domain Block (Web Proxy) “shanepppalkkbc[.]com” on 22nd December at 12:07 PM by Jane Smith”
 

Example One Recap:
The investigating analyst:

Summarises that the email sender has been spoofed, and the message actually came from Gmail.
Understands and states blocking a Google sending IP would most likely have negative consequences.
Explains the spoofed sending address value can’t be blocked, as it is used legitimately by DHL.
States the action they are taking, and provides justification for this decision.
Understands and states there would be no negative impact to the business by blocking the unusual subject line.
Lists the type of block taken, the value that was blocked, the time and date of the action, and who took the action (provides accountability).
Summarises that the URL is malicious and not owned by DHL. Quickly covers tactics used.
States the action they are taking, and provides justification for this decision.
List the type of block taken, the value that was blocked, the time and date of the action, and who took the action (provides accountability).

===========================================================
Example Two
 

In this example, a malicious email was reported to the security team by the payroll department. The email claimed to be from the UK government and tells the recipient to review the attached tax announcement. After analysis of the attachment, it was found to be Emotet malware, which infected two machines before it was contained by the incident response team. The body content also featured a URL that connects to a domain and downloads the exact same file as attached to the email. The investigating analyst retrieved the following IOCs:

Sender: HMRC-0fficial@govpayments.net
Sending Server IP: 129.33.19.188 (Example value)
Reverse DNS: mail-govpayments.net (Example value)
Subject: 2020 HMRC Tax Announcement IMPORTANT
URL: hxxp://hmrc.announcementsgov.com/1jfa/download.php? (Example value)
Attachment Name: HMRC-Tax-Announcement-README.pdf.exe
File MD5 Hash: 0a52730597fb4ffa01fc117d9e71e3a9 (Example value)
 

Example Report Section:
“[1] The sending address comes from the sending domain @govpayments.net, which is not a legitimate website used by the UK government and HMRC. [2] Although we are able to block the sending domain as it is attempting to pose as a legitimate domain owned by the government, we have only received emails from one sending mailbox, and blocking the domain at this point may be excessive. [3] Blocking the sender “HMRC-0fficial@govpayments.net” would stop more malicious emails being delivered by this sender. [4] There would be no negative impact to the business by blocking this malicious sending address.

[5] Sending Address Block (Email Gateway) “HMRC-0fficial@govpayments.net” on 1st March at 3:37 PM by Chris C.
[6] The URL used within the email is used to download the same Emotet payload as the attachment. [7] After investigating the domain, it was created purely for malicious purposes, and there is no business justification for employees to visit it, and we can block the entire domain to prevent users from visiting the existing malicious link, or any others that are hosted on the site.

[8] Domain Block (Web Proxy) “hmrc.announcementsgov.com” on 1st March at 3:41 PM by Chris C”
 

Example Two Recap:
The investigating analyst:

Summarises that the email sending domain is not a legitimate domain used by government, and is attempting to make itself look somewhat legitimate.
Explains that blocking the sending domain, although malicious, is excessive as currently only one sending mailbox has been observed sending malicious emails.
Explains that blocking the sending address would prevent more emails from being delivered.
Understands and states there would be no negative impact to the business by blocking the sending address.
Lists the type of block taken, the value that was blocked, the time and date of the action, and who took the action (provides accountability).
Summarises that the URL is malicious and used to download the same file that is included as an email attachment, and that it is Emotet malware.
States the domain is malicious and operating with purely malicious intent, and there is no legitimate reason for employees to visit the domain.
List the type of block taken, the value that was blocked, the time and date of the action, and who took the action (provides accountability).
 
 =====================================================

 Sample Final Report 

 Email Description and Artefacts Collected
Sending Address: emailsecalert1@gmail.com

Subject Line: Your Email Will be Locked! Act NOW!

Recipients:
john.smith@dicksonunited.co.uk
alice.cooper@dicksonunited.co.uk
jacon.long@dicksonunited.co.uk
fred.johnson@dicksonunited.co.uk
pickle.rick@dicksonunited.co.uk

Sending Server IP: 209.85.222.173

Reverse DNS: mail-qk1-f173.google.com (Gmail)

Reply-To: emailsecalert1@gmail.com

Date and Time: 3:21 PM Monday 1st June 2020

Full URL (sanitized): hxxps://outlook-security.emailsecalerts[.]net/index/2020/OWA.php?

Root Domain: hxxps://emailsecalerts[.]net

Looking at the reported email in the Outlook email client, this message is impersonating an Outlook security alert using branding such as Outlook logos. The email is informing recipients that their mailboxes will be closed unless they confirm their identity, where they are directed to click on a button, likely leading to a credential harvester based on the context of the email.

 

Artifact Analysis
Checking the email gateway shows that there have been no outgoing emails to the sending address, therefore no recipients have replied to the sender.

A reverse DNS search on the sending server IP shows that this email has definitely originated from Gmail, and not Microsoft.

URL2PNG analysis shows that the full URL is an Outlook credential harvester, asking users to enter in their email and password.

A VirusTotal search for the domain shows that is has been flagged for malicious and phishing activity, therefore it is known to be malicious within the security community.

Checking the SIEM and EDR no employees have made a network connection to the malicious domain, so no recipients have clicked on the link in the email at this time.

The domain is also attempting to typo squat or appear as a legitimate domain related to email security alerts, trying to make the attack more believable to targets.

 

Suggested Defensive Measures
As the sender is using a Gmail address, the most appropriate action would be to block this specific mailbox to prevent any more incoming malicious emails from this sender.

Requesting an email gateway block for the sending address “emailsecalert1@gmail.com“.

The domain has been recognised as malicious, and there is no business justification for any employees needing to access this site. As it has a malicious reputation on VirusTotal, and analysis has shown that it is hosting a credential harvester, the entire domain can be blocked on the web proxy, preventing employees from connecting to the site. This will also make future phishing attacks using this same domain ineffective.

Requesting a web proxy block for the domain “hxxps://emailsecalerts[.]net“.