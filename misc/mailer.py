#!/usr/bin/env python
# Ahmed Shawky @lnxg33k

import subprocess
import tempfile
import smtplib
import readline
import time
import email.mime.multipart
from email.MIMEText import MIMEText


def send(server, port, sender, to, reply_to, subject, body, priority):
    msg = email.mime.multipart.MIMEMultipart()
    msg['to'] = to
    msg['from'] = sender
    msg['subject'] = subject
    msg['X-Priority'] = priority
    msg.add_header('reply-to', reply_to)
    server = smtplib.SMTP(server, int(port))
    msg.attach(MIMEText(body))
    server.sendmail(sender, to, msg.as_string())
    server.close()

if __name__ == '__main__':
    print("\n=== Sending a spoofed email ===")
    server = input("[+] SMTP Server (default localhost): ") or 'localhost'
    port = input("[+] SMTP Port (defaut 25): ") or 25
    sender = input("[+] From: ").strip()
    to = input("[+] To: ").strip()
    priority = input("[+] Message priority (default 3): ").strip() or '3'
    reply_to = input("[+] Replay-To: ").strip()
    subject = input("[+] Message subject: ").strip()

    print("[!] Opening nano to write the body ..")
    time.sleep(.6)
    tmp = tempfile.NamedTemporaryFile(mode='w+t', delete=False)
    tmp_name = tmp.name
    tmp.close()
    subprocess.call(['nano', tmp_name])
    with open(tmp_name) as body:
        body = body.read()

    try:
        send(server, port, sender, to, reply_to, subject, body, priority)
        print("\n[-] E-mail successfully spoofed.")
    except Exception as e:
        exit('\nError: %s' % e)
