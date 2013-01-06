if !has("python")
    echo "Error:no python supported!"
    finish
endif


function! GoogleByWord()

python << EOF
import vim
import webbrowser
word = vim.eval("expand(\"<cword>\")")
url  = 'https://www.google.com/search?q='+word
print url
webbrowser.open(url)

EOF
endfunction




function! GoogleByLine()
python << EOF
import vim
import webbrowser
import urllib

line = vim.current.line
url = 'https://www.google.com/search?q='+ urllib.quote(line)
webbrowser.open(url)

EOF
endfunction



function! GoogleBySelect()
python << EOF
import vim
import webbrowser
import urllib

vim.command('y')
select = vim.eval('@*')
if select:
    url    = 'https://www.google.com/search?q=' + urllib.quote(select)
    webbrowser.open(url)
EOF
endfunction
