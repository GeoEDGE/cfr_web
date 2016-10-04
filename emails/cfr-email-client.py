#!/usr/bin/python
__author__ = 'Dileepa'
__companay__ = 'Geoedge'
__version__ = '1.0.0'
__app_name__ = 'cfr-email-client'

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


_to = ['dileepa.ozi@mail.com']


def msgbodygrnaration():
    return """<html>
                <body>
                    <p>This is test mail from cfr</p>
                </body>
              </html>"""


def sendmail():
    try:
        _from = 'cfr@geoedge.lk'
        _pwd = 'cfr123'

        msg = MIMEMultipart('alternative')
        subject = 'CFR Testing'
        msg['Subject'] = subject
        msg['From'] = _from

        msg['To'] = ", ".join(_to)

        msg_body = msgbodygrnaration()
        encoded_msg_body = MIMEText(msg_body, 'html')
        msg.attach(encoded_msg_body)
        mail = smtplib.SMTP("mail.geoedge.lk", 25)
        mail.ehlo()
        mail.starttls()
        mail.EnableSsl = True
        mail.login(_from, _pwd)
        mail.sendmail(_from, _to, msg.as_string())
        mail.close()
        print 'Mail successfully sent!'
        return True
    except Exception as ex:
        print ex
        return False

i = 0
while i < 2:
    sendmail()
    i+=1