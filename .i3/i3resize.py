import subprocess
import sys
import json


def i3CommandForKey(key, isLeft, isTop):
    return 'resize ' + movementForKey(key, isLeft, isTop) + ' 10px or 10 ppt'

def movementForKey(key, isLeft, isTop):
    return {
        'h' : 'shrink width' if isLeft else 'grow left',
        'l' : 'grow right' if isLeft else 'shrink width',
        'j' : 'grow down' if isTop else 'shrink height',
        'k' : 'shrink height' if isTop else 'grow up'}[key]

def getFocusedWindowFromNodes(tree):
    nodes = tree['nodes'];

    if len(nodes)>0:
        for node in tree['nodes']:
            result = getFocusedWindowFromNodes(node)
            if result is not None:
                return result

    if(tree['focused']):
        return tree
        

tree = json.loads(subprocess.check_output('i3-msg -t get_tree', shell=True).decode('utf-8'))
focused = getFocusedWindowFromNodes(tree)
print(json.dumps(focused))
rect = focused['rect']

isLeft = focused['rect']['x'] == 0
isTop  = focused['deco_rect']['y'] == 0
key    = sys.argv[1]

command = 'i3-msg -t command ' + i3CommandForKey(key, isLeft, isTop);
print(command)
subprocess.call(command, shell=True)
