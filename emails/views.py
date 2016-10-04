from django.shortcuts import render

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def msgbodygrnaration(body_params, email_type):
    email_body = None
    if email_type == 'incident_report':
        email_body = """<html>
                <body>
                    <p>Hi, """
        email_body += "<br><br>"
        email_body += "This is to inform a disaster of type of " + body_params['disaster_type'] + " has been reported " \
                      " on "+body_params['reported_date']+ " at the location of "+ body_params['address']+'.'
        email_body += "<br><br>Thank you"
        email_body += """
                    </p>
                    </body>
                    </html>"""

    if email_type == 'incident_validation':
        email_body = """<html>
                <body>
                    <p>Hi, """
        email_body += "<br><br>"
        email_body += "A disaster of type " + body_params['disaster_type'] +" that occurred on "+ body_params['address']+\
                      " reported on " + body_params['reported_date'] + " was validated by " + body_params['user']+'.'
        email_body += "<br><br>Thank you"
        email_body += """
                    </p>
                    </body>
                    </html>"""

    return email_body


def sendmail(params):
    #_to = ['dileepa.ozi@mail.com', 'dilinihb@gmail.com']
    _to = params['receiver_email']
    try:
        _from = 'cfr@geoedge.lk'
        _pwd = 'cfr123'

        msg = MIMEMultipart('alternative')
        subject = params['subject']
        msg['Subject'] = subject
        msg['From'] = _from

        msg['To'] = ", ".join(_to)

        msg_body = params['email_body']
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

