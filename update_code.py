#!/usr/bin/env python

# Expected configure file:
#   one repository per line, each line begins with a type and a space,
#   the followed by the folder name.
#   ex:
#     local /home/patrick/b2g1
#     git   /home/patrick/mozilla-central
#     gitm  /home/patrick/mirror
#     b2g   /home/patrick/B2G
#   type:
#     local: configure descripted in .ckconf
#     git:   should update repositery with git.
#     gitm:  should update respositery with git as a mirror
#     b2g:   should run repo sync in the folder.

import sys, os

def update_local(loc):
    # read ".ckconf"
    f = open(loc + "/.ckconf", "r")
    read_conf(f, loc)
    f.close()

def update_git(loc):
    subprocess.call(["git", "fetch"], cwd = loc)

def update_gitm(loc):
    raise Exception("Updating git mirror haven't been done yet.")

def update_b2g(loc):
    subprocess.call(["git", "pull"], cwd = loc)
    subprocess.call([loc + "/B2G/repo", "sync"], cwd = loc)

func_route = {
    "local": update_local,
    "git":   update_git,
    "gitm":  update_gitm,
    "b2g":   update_b2g
}

def update_single(line):
    # parse repository info.
    m = re.match(r'[a-z]+\s+.+', line)
    if m == None:
        raise Exception("Cannot parse configure")
    tp = m.group(1)
    loc = m.group(2) if base == None else base + m.group(2)
    func = func_route[tp]
    if func == None:
        raise Exception("Unsupported type")
    print "Update {0} repo: {1}".format(tp, loc)
    func(loc)

def read_conf(conf_file, base = None):
    while True:
        line = conf._filereadline()
        line = l.decode('utf8')
        if line == "":
            break
        line = line.strip()
        update_single(line, base)

if __name__ == "__main__":
    read_conf(sys.stdin)
