if !has("python")
    echo "Error:no python supported!"
    finish
endif


function! Gnote()

python << EOF

import imaplib
import time
import vim
class Gmail(object):
    IMAP_SERVER= 'imap.gmail.com'
    IMAP_PORT  = 993

    def __init__(self,usr,pwd):
        self.usr = usr
        self.pwd = pwd
        self.hld = imaplib.IMAP4_SSL(self.IMAP_SERVER,self.IMAP_PORT)
        self.status = 0

    def login(self):
        rc,res = self.hld.login(self.usr,self.pwd)
        code = self.checkcode(res)
        if code == True:
            self.status = 1
        return code

    def logout(self):
        self.hld.logout()

    @staticmethod
    def checkcode(code):
        code = str(code).upper()
        if 'OK' in code:
            return True
        else:
            return False

    def __del__(self):
        if self.status == 1:
            self.hld.logout()

    def addbox(self,mailbox):
        rc,res = self.hld.create(mailbox)
        code = self.checkcode(rc)
        return code

    def delbox(self,mailbox):
        rc,res = self.hld.delete(mailbox)
        code   = self.checkcode(rc)
        return code

    def modbox(self,oldbox,newbox):
        rc,res = self.hld.rename(oldbox,newbox)
        code = self.checkcode(rc)
        return code

    def addnote(self,mailbox,content):
        t = time.strftime("%Y-%m-%d %H:%M:%S")
        content = "From: %s\n\ntime:%s\n\n%s"%(self.usr,t,content)
        rc,res  = self.hld.append(mailbox,None,None,content)
        code = self.checkcode(rc)
        return code

def main():
    user = vim.eval("g:gnote_gmail_username")
    pawd = vim.eval("g:gnote_gmail_password")
    mailbox = ''.join(vim.current.buffer[0])
    gmail = Gmail(user,pawd)
    gmail.login()
    try:
        gmail.addbox(mailbox)
    except:
        pass

    note = '\r\n'.join(vim.current.buffer[1:])
    code = gmail.addnote(mailbox,note)
    if code == True:
        print 'send to %s successful!'%mailbox
    else:
        print 'send failed!'

if __name__ == '__main__':
    main()

EOF
endfunction
